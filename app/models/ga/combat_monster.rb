class Ga::CombatMonster < Ga::AskPeople

  def set_action_result

    monster_on_board = check_for_monster

    if monster_on_board

      monster = monster_on_board.monster

      ActiveRecord::Base.transaction do

        # First : will test
        will_test_result = investigator.make_test( :will, monster.willpower_test )
        if will_test_result < monster.horror
          investigator.decrement( :sanity, monster.horror - will_test_result )
        end
        
         # Investigator has sanity ?
        if investigator.sanity > 0
          # Second : combat test
          combat_test_result = investigator.make_test( :combat, monster.combat_test )
          if combat_test_result < monster.damages
            # We check if investigator take damages
            investigator.decrement( :stamina, monster.damages - combat_test_result )
          end
          # In any cases, the monster take damages
          monster_on_board.decrement( :hit_points, combat_test_result )

          if investigator.stamina <= 0
            @action_result = :investigator_die
          else
            if monster_on_board.hit_points <= 0
              monster_on_board.destroy
              @action_result = :monster_die
            else
              @action_result = :a_hard_fight_but_nobody_win
            end
          end
        else
          @action_result = :investigator_goes_mad
        end
      end
    else
      @action_result = :no_monster_on_board
    end
  end

  def get_action_name
    :combat_monster
  end

end
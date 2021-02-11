using System;
using Xunit;
using rockpaperscissors;

namespace test
{
    public class RoundResult_ResultCorrect
    {
        [Theory]
        [InlineData(Move.Rock, Move.Scissors)]
        [InlineData(Move.Paper, Move.Rock)]
        [InlineData(Move.Scissors, Move.Paper)]
        public void ResultCorrect_PlayerBeatComputer_ResultWin(Move playerMove, Move computerMove)
        {
            // arrange
            RoundResult roundResult = new RoundResult(playerMove, computerMove);

            // act


            // assert
            Assert.Equal(Result.Win, roundResult.Result);
        }

        [Theory]
        [InlineData(Move.Rock, Move.Paper)]
        [InlineData(Move.Paper, Move.Scissors)]
        [InlineData(Move.Scissors, Move.Rock)]
        public void ResultCorrect_ComputerBeatPlayer_ResultLose(Move playerMove, Move computerMove)
        {
            // arrange
            RoundResult roundResult = new RoundResult(playerMove, computerMove);

            // act


            // assert
            Assert.Equal(Result.Lose, roundResult.Result);
        }

        [Theory]
        [InlineData(Move.Rock, Move.Rock)]
        [InlineData(Move.Paper, Move.Paper)]
        [InlineData(Move.Scissors, Move.Scissors)]
        public void ResultCorrect_MatchingMove_ResultDraw(Move playerMove, Move computerMove)
        {
            // arrange
            RoundResult roundResult = new RoundResult(playerMove, computerMove);

            // act


            // assert
            Assert.Equal(Result.Draw, roundResult.Result);
        }

        [Theory]
        [InlineData((Move)15, (Move)84)]
        public void ResultCorrect_InvalidMove_ResultLose(Move playerMove, Move computerMove)
        {
            // arrange
            RoundResult roundResult = new RoundResult(playerMove, computerMove);

            // act


            // assert
            Assert.Equal(Result.Lose, roundResult.Result);
        }
    }
}

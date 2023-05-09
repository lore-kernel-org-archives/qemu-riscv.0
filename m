Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8F1C7EE22
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 May 2023 09:25:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwJav-0003pg-HA; Tue, 09 May 2023 05:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwJau-0003pY-Q9
 for qemu-riscv@nongnu.org; Tue, 09 May 2023 05:25:16 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwJaj-0000Lg-CO
 for qemu-riscv@nongnu.org; Tue, 09 May 2023 05:25:16 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50be17a1eceso10879113a12.2
 for <qemu-riscv@nongnu.org>; Tue, 09 May 2023 02:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683624302; x=1686216302;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zftOKcOsUhu3qbc4DdwFnG4UymaAt0p8Je9qu6wvSXg=;
 b=i137UA2FKjxPMFyt+/fvUFZbUDdEruiNlNCIY9D0TqC4+T94E9FLZTL9DaUkAh7OYb
 Ee4fRsxUFw1MzUiqppDz74fK6gnul9bajB4IU0n7/8dlE7nmSipvI9AAs/ACzpyIvkGH
 SagL8eao0zpaJ3rlhxcra83WC5TTjkDLxhIReCkzBgnPI1qszlHJHHR1Pk27NEOuaLb0
 XvKWeWtrOidz63Iz1ya3l4Wpa1rOSDfr8kAD1/B7Dh82p0HrPrFAchIs1QVy++vu7j/2
 sCDVBjsWs3/Ue27XWVTfjTK7FNCQGsMktLywiZko/n3SAZ+Q7ZucJxeONF3cdmNlE2Ma
 g0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683624302; x=1686216302;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zftOKcOsUhu3qbc4DdwFnG4UymaAt0p8Je9qu6wvSXg=;
 b=AlK1xV3QT8HpdC5DSpldIPip/gD8CztixnOCwXwtrSoLnVXAI6nOo6WCk8fVuPAbkw
 ruqP7cdRSSB5GPO+7tDbQkxpwVCbO9AOckcRrlGUD2t5cY9IGAkR1XmJfs1o5I0gXsQq
 S2SqWMLTSK9J3AxPf0OHvwNo/zaJtUHgHVJ19JbZP9cXgYlTWqfAq5o4SWN0S/FoZzKn
 vjWP8y4lB2aeQaopN8MajD5oU1iuwzMtnTN0unNMXEyfUQVrIojx1AdiBFjcYG+2f0Kc
 r0RMctd38B0nM9Nr6Tc2cSgghlUHLkmN9L8a6XJgqsfFwi9wFTwSLKXLafaYeLPh43oz
 2LpQ==
X-Gm-Message-State: AC+VfDypzHJO3+sqPZ4XKBz8+e3hA9ZubbDzwOZYnrxWQrUP0Y72zDJ6
 y4kq763KVfEEP4fXOh/KGX0wjEgBXZTpORcY3iFHUq4luoanPZCo
X-Google-Smtp-Source: ACHHUZ53fnQvFsH54kHJ3CNi3eHgKdSalq1KX3WTW/sZA9kFRVuOZ3groDER0osYHg/ZOqCRNGVCEd6TN5WoxeR4G+E=
X-Received: by 2002:aa7:d54c:0:b0:4fd:2b04:6e8b with SMTP id
 u12-20020aa7d54c000000b004fd2b046e8bmr11060846edr.29.1683624302292; Tue, 09
 May 2023 02:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-31-richard.henderson@linaro.org>
 <CAFEAcA9dOpZUeCnkHxmSAPTs20ZuUW++kFEtp2icmmST=yGPvA@mail.gmail.com>
 <58a0667e-7387-4231-85d4-548a39c8064f@linaro.org>
In-Reply-To: <58a0667e-7387-4231-85d4-548a39c8064f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 10:24:51 +0100
Message-ID: <CAFEAcA8h-+U8MW1b1QfyoX=vjZdMLi4EcjgsARNb4AKpn35sgw@mail.gmail.com>
Subject: Re: [PATCH v4 30/57] tcg/sparc64: Allocate %g2 as a third temporary
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, 8 May 2023 at 16:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/5/23 13:19, Peter Maydell wrote:
> > On Wed, 3 May 2023 at 08:17, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
> >>   1 file changed, 7 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> >> index e997db2645..64464ab363 100644
> >> --- a/tcg/sparc64/tcg-target.c.inc
> >> +++ b/tcg/sparc64/tcg-target.c.inc
> >> @@ -83,9 +83,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
> >>   #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
> >>   #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
> >>
> >> -/* Define some temporary registers.  T2 is used for constant generation.  */
> >> +/* Define some temporary registers.  T3 is used for constant generation.  */
> >>   #define TCG_REG_T1  TCG_REG_G1
> >> -#define TCG_REG_T2  TCG_REG_O7
> >> +#define TCG_REG_T2  TCG_REG_G2
> >> +#define TCG_REG_T3  TCG_REG_O7
> >>
> >>   #ifndef CONFIG_SOFTMMU
> >>   # define TCG_GUEST_BASE_REG TCG_REG_I5
> >> @@ -110,7 +111,6 @@ static const int tcg_target_reg_alloc_order[] = {
> >>       TCG_REG_I4,
> >>       TCG_REG_I5,
> >>
> >> -    TCG_REG_G2,
> >>       TCG_REG_G3,
> >>       TCG_REG_G4,
> >>       TCG_REG_G5,
> >> @@ -492,8 +492,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
> >>   static void tcg_out_movi(TCGContext *s, TCGType type,
> >>                            TCGReg ret, tcg_target_long arg)
> >>   {
> >> -    tcg_debug_assert(ret != TCG_REG_T2);
> >> -    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
> >> +    tcg_debug_assert(ret != TCG_REG_T3);
> >> +    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T3);
> >>   }
> >
> > Why do we need to change this usage of TCG_REG_T2 but not
> > any of the others ?
>
> To match the comment above.

To expand, what I mean is "when I'm reviewing this patch, what
do I need to know in order to know whether any particular
instance of TCG_REG_T2 should be changed to _T3 or not?".
All the sites where we *don't* change T2 to T3 are now
using a different register, so there is presumably some
logic for how we tell whether that's safe or not. The
"no behaviour change" option would be to change all of them.

thanks
-- PMM


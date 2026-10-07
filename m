Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6B5CA6007
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 14:35:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xESjs-0005UZ-3S; Wed, 07 Oct 2026 10:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xESis-00057z-0O
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 10:34:27 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xESiq-0001Dg-7a
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 10:34:21 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6afa651700eso3157842a12.2
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 07:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791383659; cv=none;
 d=google.com; s=arc-20260327;
 b=BnG6pcGuWR/cW1bZVuY2hy7C3DdG8X8SCSKxr3xFhUrUwxF2/NA079BFxg3EN66ua6
 LM1xLZBhPDACDoFvRaYc2/Q2ME9xfy8cIf6eHspRkHdos3mSBtc0yWTN3Wi3Wvo0KV1Z
 1BZMQuSOK9CqHwE9wk0iFu7Wu2Znq+SRFPjdqq+xm1Gr2+PJmdh1PKQR/f24JBt/x7UA
 LvdfZ7Z/C6TM9PZzpzsYzUdWqW2ESDGjyPZ4uoCLAG2V1UObTyKooiCxbLT/NPSw6BlP
 kxTQRj4uYri1zMoKKwxZy5HYJrvdmHhSTWkQg60urN/herGglgdxG8bM5ooG4xwOjohm
 6TSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=7aWVtqBMa4m94OxObYDVRhoQtf5Of/nXKWd9uNK1Uzo=;
 fh=YhJjtyEyGe7zX4ymIVTthUo0iJKcMp1q7Y38jWnAyJg=;
 b=Dtr/G3VbPfiYWUpCYrHlv+1PBvwmsSeg9Ff9YFOvq2TOW//OFJT4qybjysTEvSikJP
 txcyGhSIDCoqd//ol8P2OMs9HvOgJPQs5jCAA/W2/gbFkWL1p5+BwRVAGcSM4n/fyuAe
 8PmCgaUoBcxBR7uMda5QGTTX19GdqEDLUlc09yF3iGwDMvbjkdeaVCVu2qjKdEBHwbUw
 uccmflgQD7r/KwyDpZ+sf/7HWOVZO4atfnIzqSLwGLsU4rPBFOw7WLMWZXoXgl9X9GVQ
 zqD7XcyLETM4DuTO9gjhvjimDsLn7fmEYqX1E0WwNGP9gO6fzt+rwXs6JTC99BiM+g39
 DPsg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791383659; x=1791988459; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=7aWVtqBMa4m94OxObYDVRhoQtf5Of/nXKWd9uNK1Uzo=;
 b=XO1s65mOJrK+7yheqCquHpEO6rDypmIjqlR1/BnAP9GsMzYMa8XVfXBNZhqxsN/tHi
 Uw20sXog7qbyKlAsNPrmZom0IPi4wU/tZrTKNlCgPBfu/u4mSH/ur2c1eNm5WQYeldlR
 hUScNY/eS3vzTcPisWb7j+0Tr2/YNoRnkyFldt/8c7nnJEdRP8HbP0UMd/lryjljMfwW
 6tPRZN4l2hoAhERNfpPbWR4zIeMEHFtXyVVqTpVy9QkZmWT3tyOKaUfwJHwNXJxK3eAu
 7TFBScdTRj4qkWkyxKqW/Um6oiACAGFLQX/OmfqZI78lzbsRrsVWyKvW1FfpY16M028s
 mlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791383659; x=1791988459;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7aWVtqBMa4m94OxObYDVRhoQtf5Of/nXKWd9uNK1Uzo=;
 b=2vI4FRtOK0SP1v18pfnshaQIiuoq0otsTraBegHVw19eMWLRWcFSvzozmNQGUZSxbl
 v80oXGIiCTxCe/G5MacDJXrSIDbJ8iMhVU7ZZIQvl4v5sxYPzuqpVs42EGcvWJPHNCdv
 AL1RSeGiJBBTI14mfqJoFOhunwOLblP0PXr4EJ/8S27ZPQFJazH1Kl+PMUJ0SNHBQVG2
 VAeSytvLQiP+vNNml5LvivI7nYpwLu0U4uOzGNIIUwQvLO6tWzU2W5ScshpZwuLKNX5N
 3z3b7UR7LVyG4ICVlNCIyhRha05/ilp93b/OsdAYdEzNMqKI51Z2MXJWmRIMZdCoknvH
 T/Gw==
X-Forwarded-Encrypted: i=1;
 AKwUvByoX+Y2ne5isnLUHUIxN9jpHLvf/uLpK+1utNjcs2XcfanQzdUfQtpPm8Z7tAmbQqbpnLygubhWr5fJ@nongnu.org
X-Gm-Message-State: AFq9FYIQqET7QyyDRvfiopB8awveX/mWyhtM7G8FjkL3LMkmb4DxwZYo
 vnQBCGbyPBhkv0gFO/3k1YvC0OJQqHXxy6KAK4n8CHXNFpy2iCNSYV2IpusqurblMRSHYaAvb2R
 CYyZm65yqH18mIN8QMCbnUdNOa63Zwd0=
X-Gm-Gg: AYBFou3JiTEwFZ5Eog0/QDwJM96A1BdyUctq8nBlWwGy0tsSwwXCQGQD+o9eGGrGxG8
 slPEvjjgoAZXe8IfBM8IVfn5NURz77CZ8fTtmxDrNxwib8aR6SLpqqHsYlwwxjQK1KkIBlan0hl
 HmD90UJ668aAuxS+DctzZKPt+wGXuP9nLFn5V92tAOK85SaFTRKSOeTSAikbkq2sVDh+5x8rttm
 8XUCV2d9D5XG26Ypy6gmhaPyu3nMqsaX0Kk4L1nZdQdqLlWAgZPHrn7IhmtK+iPtBUrSwHja0CD
 zLLoMc+GLqGWzR9iQEauvecgnocldI1Ai86f8gqzdU6Dy4XfFweuwKM=
X-Received: by 2002:a05:6402:4552:b0:6ac:6a3f:c626 with SMTP id
 4fb4d7f45d1cf-6aff38f1bfdmr1846042a12.8.1791383658583; Wed, 07 Oct 2026
 07:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-14-8a2f0f296a7f@rev.ng>
 <17cb7c7c-5f22-4a03-8855-4d1ec91d347a@oss.qualcomm.com>
 <CAE2XoE9eXXKQGZZ0kvmex88+tjch1-+H_-MgB6JEu+4bdPZq8g@mail.gmail.com>
 <9bf8945c-6472-462e-a275-f0b74912d3ed@oss.qualcomm.com>
 <CAE2XoE9QzGda8J9QCQysRL8OoxBrR86Ft426Rf4TXJxnPm+Vsg@mail.gmail.com>
 <2874719a-ca6d-473f-a29f-e40f56016fc9@oss.qualcomm.com>
In-Reply-To: <2874719a-ca6d-473f-a29f-e40f56016fc9@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 7 Oct 2026 22:34:05 +0800
X-Gm-Features: AclHuK_U3dIA-a4SjrKVS6p_GZp8NYJKGCIAy1KT89uzv6DGzNhQs71VPPPW9Ss
Message-ID: <CAE2XoE_tc-UtfaRvczUsz5M11PP8mhDGMPUEYjN6Eb1v0VWB=Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] target/riscv: Compile pmp.c once
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 daniel.barboza@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Oct 7, 2026 at 9:54=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Phil.
>
> Regards,
>
> I missed it, but again Anton's comment were in this patch
> description I wouldn't had barked.
>
> How does this will work in heterogeneous binary with one
> RV32 and another RV64 cores running together?
>
> [we tend to avoid top-posting on technical lists]
>

Hi Phil
From my point of view, it should be handled in the function
target_long_bits instead for the future heterogeneous simulation.
So in future target_long_bits can even return 128bit instead.
We can ensure a single cpu can run on a single thread. That is, a
single thread can not running
two different CPU architectures, so we can use thread-local-storage
for target_long_bits() to retrieve
what the current thread's cpu bits are. Otherwise, heterogeneous
simulation would be rather hard(my point of view).

> On 7/10/26 15:39, Yonggang Luo wrote:
> > It's here https://lore.kernel.org/qemu-devel/ar9WZip2Q2G0qvQI@hive.loca=
ldomain/
> >
> > From: Anton Johansson via qemu development <qemu-devel@nongnu.org>
> >
> >
> > I wouldn't be surprised if that's the case, although I'm personally a
> > bit scared of riscv_cpu_mxl_bits() since it returns 128 for MXL_128, so
> > if it's not used carefully or on clear MXL_[32|64] paths you could easi=
ly
> > get UB.
> >
> >
> > On Wed, Oct 7, 2026 at 9:26=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
> > <philmd@oss.qualcomm.com> wrote:
> >>
> >> On 7/10/26 13:51, Yonggang Luo wrote:
> >>> On Wed, Oct 7, 2026 at 6:25=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
> >>> <philmd@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 7/10/26 10:43, Anton Johansson wrote:
> >>>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> >>>>> Signed-off-by: Anton Johansson <anjo@rev.ng>
> >>>>> ---
> >>>>>     target/riscv/tcg/pmp.c       | 5 +++--
> >>>>>     target/riscv/tcg/meson.build | 2 +-
> >>>>>     2 files changed, 4 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
> >>>>> index 99345d63dc..2d7194de10 100644
> >>>>> --- a/target/riscv/tcg/pmp.c
> >>>>> +++ b/target/riscv/tcg/pmp.c
> >>>>> @@ -638,19 +638,20 @@ uint64_t pmpaddr_csr_read(CPURISCVState *env,=
 uint32_t addr_index)
> >>>>>         if (addr_index < pmp_regions) {
> >>>>>             val =3D env->pmp_state.pmp[addr_index].addr_reg;
> >>>>>             int g =3D pmp_get_granularity_g(env);
> >>>>> +        const unsigned long_bits =3D target_long_bits();
> >>>>
> >>>> We need to fetch this information from @env. Maybe riscv_cpu_mxl_bit=
s()?
> >>>
> >>> discussed before, there is possible be 128bits
> >>
> >> Please point me to the discussion (directly, saving us a ping / pong),
> >> as:
> >>
> >>     '''
> >>     This was already discussed on v42:
> >>
> >>     https://lore.kernel.org/qemu-devel/some-message-id-v42-20128438/
> >>     '''
> >>
> >> Having the discussion decision resumed in the patch description will
> >> prevent further reviewers to ask again the same.
> >>
> >> What do you mean by "possible be 128bits"? If we want to cap the
> >> value we can use MIN(64, riscv_cpu_mxl_bits(env)).
> >>
> >>>
> >>>>>             switch (pmp_get_a_field(env->pmp_state.pmp[addr_index].=
cfg_reg)) {
> >>>>>             case PMP_AMATCH_OFF:
> >>>>>                 /* fallthrough */
> >>>>>             case PMP_AMATCH_TOR:
> >>>>>                 /* Bit [g-1:0] read all zero */
> >>>>> -            if (g >=3D 1 && g < TARGET_LONG_BITS) {
> >>>>> +            if (g >=3D 1 && g < long_bits) {
> >>>>>                     uint64_t granule =3D 1ULL << g;
> >>>>>                     val =3D ROUND_DOWN(val, granule);
> >>>>>                 }
> >>>>>                 break;
> >>>>>             case PMP_AMATCH_NAPOT:
> >>>>>                 /* Bit [g-2:0] read all one */
> >>>>> -            if (g >=3D 2 && g < TARGET_LONG_BITS) {
> >>>>> +            if (g >=3D 2 && g < long_bits) {
> >>>>>                     val =3D deposit64(val, 0, g - 1, -1ULL);
> >>>>>                 }
> >>>>>                 break;
> >>>>
> >>>
> >>>
> >>
> >
> >
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F1DCA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 13:40:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xERsP-0004aw-FL; Wed, 07 Oct 2026 09:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xERsN-0004aD-Tn
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 09:40:07 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xERsM-0003FF-0I
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 09:40:07 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6a082b3671fso2851426a12.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 06:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791380404; cv=none;
 d=google.com; s=arc-20260327;
 b=X1bsm7f4k5rqs3dXeHa0qyjxK0V6ReYTT/MvVg2HkW9SHeyBmetpcNQNvHfoZwLjHr
 yebWQHm2rhUj9h7CaInXVD/8Csqi6vWStPBeln0MpUQlwZ02J56lYoOGkrdp/zk4b64t
 gfVq/UYCatMe/3kMjBt91oMxuB3ex6VK/FNTS9twJhGoa9l8JpC8Yh44xL4WKSd7dAbM
 L1ndMn1Xl5reP/VwPhXhfbfqVQTTSa6mME9m4v30U8Zju52Ic28rHC8PI705RpBCQeYR
 VfVbkODwyN6ZZF7VmMaKiCVEYLDJo7K9C/4pN2ASJnvmnszSCC9ubyReGW8J0XC2/PW5
 8nww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=kijGPFj8mxU0eUyLnYHgGpuj3XE89WWVKq4eeg14sqE=;
 fh=vk0Z42bm1sqF1dcEWh1Z2cURgd6km31yZSJiWlAlvIw=;
 b=HvluRgSePNfX1kkVQ1PpTMohYVQsaycf5I8ZECFPFCumqcXqwHV8tK9NX31F0gyNq3
 fLn8Ib13ArrOLLSMlxe3UKwtbxXjEr/8ZPzY4ub4N7WdECY6GUyUMgzYVz/3qsFHuJ6S
 Fw+7YoRtQ0zr7UEwVSZWr8yVc/6iidOXKxbzIARz/EOk87jO67yRacF/zk2DVGJ0K5mY
 PFzGpbWWrv2i8J+EHy80xIBSEnfT1pgDV6kHyaS99uYziFausZIScT98QrKj5z65RxVC
 tl3o6LU1uzPobcJz7kNa/4LZgBXPWTrHjLakMOBwzErk6b72JVBeUN2tP9Te/hWNp9p5
 CI1A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791380404; x=1791985204; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kijGPFj8mxU0eUyLnYHgGpuj3XE89WWVKq4eeg14sqE=;
 b=jYAVK7C+Jfi1duK3M1Ldc01kpNT1FKJfEws0KhME0WBY3raSbLCg5/tBeXgEB4pFzD
 809KReJZmo0AH+IFOYnA31dkoLLoIQ1aLK7Gg/f/I1RwQI9EzfCwL29opSkMYYwo1ndR
 cE7mVf8BeiWjP/6XAO1JAO/Dn8Zr0Z4D7780lgM/YoKoj1MxBTnKXcMqevIM+r6v8nCn
 o6UN4BPe0A50fVlEdoIZtsaifZocsKfVkrhd08sDM948V4PU1r4LYVK9LiunOuPV2zBi
 /ZaBxI91P5sMRg0cKCaWpu12SPrBpzhy0cHPMADTHw6/Ti8g2H9EYIxsF75uvqVJGy68
 0+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791380404; x=1791985204;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kijGPFj8mxU0eUyLnYHgGpuj3XE89WWVKq4eeg14sqE=;
 b=1Lkg4YQq8RWgtxq4X/COe0UFpudgb7ePdXUYJCLyUAsIuj6+WKuSlHqwXFrxLtS8GE
 /8lpShDQGD/82W1b5oMQDX3M9G0DsyK5CiN9Y7+NZ1THIeIQBnzpwv+u4uXUmokWCgN6
 kSlHIhnMhcRq3dpbvT17Gaj14/62LPG6exMsNLt+3/Kqb4BQnLvouZ5PUh7gbAJjQg5f
 IGMuom+NbA3qwpaX0YbXkidQ1Mi8Joomh9Co7DnncnaLBoLGxwosDLlo/BHvIzv7zAwn
 T4yl0QbmABSOyx7lYGdVqT37H9j9t9r6LFy/xLTsOrpjr3kqs+EezG79uLBW/Sci4FHc
 4gsw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtDWqcI5Aqu8XIirnV3a16BgE06pUhlnbCePTlIvDaKEMvibQNvbz3ZpfzR45N8cBJ7TJvr5gLyk82@nongnu.org
X-Gm-Message-State: AFq9FYIN39h3nLzuHTB4FFCssfY/18K3YL1f2BJID1Wo8l/jEWcYjek3
 i4j83vWk1pjZPsrxgPxDzCVuIsdDiYmI1a3WkI2uZ2D2NES5VifqsBUrAuABV+uFg0psmY1RRbp
 38ph5HYYVsMjmClEUlXreCe+4+gRQ51U=
X-Gm-Gg: AYBFou3QS0TXRytosbfiKlE9CXZvp4TxKLIy/KqOR4epT+IXq450e/7Kdfj2eG+S1Gf
 Qa7RVfokFUyMDjO6uL/QtbNrED2t0Egbtc5lTTbClHg0VGtbhHvf7ygHp466RffC4wyIFElKhtj
 VzJHVMmbukW+5+Lgcis4C/oQRI5GDxogi1sQz5kpYkgDXh5moAH8JaAGADJ2cNXuRWAvoGijS4p
 OuOzm52ZoCAnM77NzWizXGhzQDZHZKsPKKBE7PYsS3qUaYD/TBWT8bQ+OZvKCYrQNErhDgKp+Ax
 vgLFAvQoZ9Yp4JOnXOGny/eQuZ2DgLARwfraOrqOlqD5qQfkWpvvRqU=
X-Received: by 2002:a17:907:6090:b0:c29:f5d5:5a97 with SMTP id
 a640c23a62f3a-c317be5efa6mr220749466b.33.1791380404008; Wed, 07 Oct 2026
 06:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-14-8a2f0f296a7f@rev.ng>
 <17cb7c7c-5f22-4a03-8855-4d1ec91d347a@oss.qualcomm.com>
 <CAE2XoE9eXXKQGZZ0kvmex88+tjch1-+H_-MgB6JEu+4bdPZq8g@mail.gmail.com>
 <9bf8945c-6472-462e-a275-f0b74912d3ed@oss.qualcomm.com>
In-Reply-To: <9bf8945c-6472-462e-a275-f0b74912d3ed@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 7 Oct 2026 21:39:49 +0800
X-Gm-Features: AclHuK9eXu9v8s72KRA0zeVlJz0HvpGEORAabRshStrlJLOlK_G9Ts7ICmO9lA0
Message-ID: <CAE2XoE9QzGda8J9QCQysRL8OoxBrR86Ft426Rf4TXJxnPm+Vsg@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] target/riscv: Compile pmp.c once
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 daniel.barboza@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

It's here https://lore.kernel.org/qemu-devel/ar9WZip2Q2G0qvQI@hive.localdom=
ain/

From: Anton Johansson via qemu development <qemu-devel@nongnu.org>


I wouldn't be surprised if that's the case, although I'm personally a
bit scared of riscv_cpu_mxl_bits() since it returns 128 for MXL_128, so
if it's not used carefully or on clear MXL_[32|64] paths you could easily
get UB.


On Wed, Oct 7, 2026 at 9:26=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 7/10/26 13:51, Yonggang Luo wrote:
> > On Wed, Oct 7, 2026 at 6:25=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
> > <philmd@oss.qualcomm.com> wrote:
> >>
> >> On 7/10/26 10:43, Anton Johansson wrote:
> >>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> >>> Signed-off-by: Anton Johansson <anjo@rev.ng>
> >>> ---
> >>>    target/riscv/tcg/pmp.c       | 5 +++--
> >>>    target/riscv/tcg/meson.build | 2 +-
> >>>    2 files changed, 4 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
> >>> index 99345d63dc..2d7194de10 100644
> >>> --- a/target/riscv/tcg/pmp.c
> >>> +++ b/target/riscv/tcg/pmp.c
> >>> @@ -638,19 +638,20 @@ uint64_t pmpaddr_csr_read(CPURISCVState *env, u=
int32_t addr_index)
> >>>        if (addr_index < pmp_regions) {
> >>>            val =3D env->pmp_state.pmp[addr_index].addr_reg;
> >>>            int g =3D pmp_get_granularity_g(env);
> >>> +        const unsigned long_bits =3D target_long_bits();
> >>
> >> We need to fetch this information from @env. Maybe riscv_cpu_mxl_bits(=
)?
> >
> > discussed before, there is possible be 128bits
>
> Please point me to the discussion (directly, saving us a ping / pong),
> as:
>
>    '''
>    This was already discussed on v42:
>
>    https://lore.kernel.org/qemu-devel/some-message-id-v42-20128438/
>    '''
>
> Having the discussion decision resumed in the patch description will
> prevent further reviewers to ask again the same.
>
> What do you mean by "possible be 128bits"? If we want to cap the
> value we can use MIN(64, riscv_cpu_mxl_bits(env)).
>
> >
> >>>            switch (pmp_get_a_field(env->pmp_state.pmp[addr_index].cfg=
_reg)) {
> >>>            case PMP_AMATCH_OFF:
> >>>                /* fallthrough */
> >>>            case PMP_AMATCH_TOR:
> >>>                /* Bit [g-1:0] read all zero */
> >>> -            if (g >=3D 1 && g < TARGET_LONG_BITS) {
> >>> +            if (g >=3D 1 && g < long_bits) {
> >>>                    uint64_t granule =3D 1ULL << g;
> >>>                    val =3D ROUND_DOWN(val, granule);
> >>>                }
> >>>                break;
> >>>            case PMP_AMATCH_NAPOT:
> >>>                /* Bit [g-2:0] read all one */
> >>> -            if (g >=3D 2 && g < TARGET_LONG_BITS) {
> >>> +            if (g >=3D 2 && g < long_bits) {
> >>>                    val =3D deposit64(val, 0, g - 1, -1ULL);
> >>>                }
> >>>                break;
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


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A266CD98F0
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 03:04:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbUwn-0004XO-BP; Sun, 21 Jun 2026 23:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbUwi-0004Vq-EY
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:03:36 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbUwg-0004vp-Ph
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:03:36 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-693c69b97e7so6242098a12.2
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 20:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782097413; cv=none;
 d=google.com; s=arc-20240605;
 b=PbWiSi4wrym4oaBaTRI27oOJpkgg5YcJo7zL3t4Jv1JOmT+m5JY+PiKqIP2kuWHVkc
 /aul0LpfJdPqw9Y6XO7wT/zGxIhUKb7Y0a3IOjtTGAfDlkcREnX7eiTvrHjHdgaFkfMi
 UUkYvwxY0i9VAtGU652/ZjqxozNz9imHtKUDTJx/t/bskbiN6dSfMg6M++6a3qQ7ZsSY
 eKWduiK9QUjImY0SSNPnn7WfgVXbJtq1LGTLXIqwckAYbPohtOl5NlhvU8IY0sJaiFMP
 dbCc346ht9zdfjL3+P3Ju9J2D+Fjw3cnGqCB8vPChEjzFeNXYIo9pI2ldMTkyizpluy0
 kOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Zm1XUkgLFCUl1+npnTvCWYpIX9/4Q7Uv+87zd9HrCaA=;
 fh=X3DDDarRTXvDvmi7pm6yW15BLxoqIBSyZqYNE33dpP4=;
 b=M+98QVUPzNJUbw13cEWKoHilkH3uZXDbghL+//Xoq2MBPZh10YxYCSxorSPHSiMPK6
 T5N0olvVA7Gb3jEMmQeBsc6efi8MGBZ32jHUcNnOfa3iJyIvGlXPOFJ6up1ukpKokspo
 JaTi4aq97W9P8hIUdIUC1mxn2QprZmGQbFNrRF9m1+MPRInjvYS8HAzRTsH/N6toyyOT
 /B6JWg8ax6KqprsJC4h2JctcLVhI+wTRtwSgu2qJuGpDTGDxF5CvCySCfzNelCkk7CyW
 ouoDNLAakeW6eir1qhKyePQox3pLb65xc3HM3JgPngxFpYJWyTpAKu+N/P7MyPNyUi+9
 Jx3g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782097413; x=1782702213; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zm1XUkgLFCUl1+npnTvCWYpIX9/4Q7Uv+87zd9HrCaA=;
 b=VJee01z986tcOuw93wu2cylJhk8zsrYYbSNWmcUFwq+IvfFKQaFIrFdPQ2haIjwbEe
 C3UqizxuW3R8tiivjgk25Dqb6QhkQf/LobXuUukvnbLqoJasj74KEnaCdmmr/AFiHijl
 ZVyeFg6oNZUP8V5ePkN2GU9LO/RKXBRdPYP52wVDaZpVdStHY+4yL1ICZW5hDVNrfsYV
 dAdTy2yHJR9pwcwpRH0HYs7AJwPtZr7LOZ7/VF6LNO7jpDyDd+ZXSMF3BFvowhNmgKV6
 p8mGeFenns09Uz2yL25rzmTSe5odvoYHLRtO6EDabyNvLhWaCEYTazdrbQAYJ2kFprOI
 Ndkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782097413; x=1782702213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Zm1XUkgLFCUl1+npnTvCWYpIX9/4Q7Uv+87zd9HrCaA=;
 b=ZUaGrZxvV4v52YkSoyzN722ScAdtKoTcrknJ4He6VXaKLeumTOKMrwnK9K+3coY9Yg
 cfLWWDPlyhLi5o4Cjc5SQOU4qqbo7w6A59QGlIzOzU1A7LoQWCjYZgk+QUKleeCGodeH
 EnyDsJ0/r8Jd+XF1Wy9i3LhcVzPC9ITwvKM1hG6KYkjtBzOBcXpiu0BqsqY+ZP6GXbFW
 qD2QE2hqzrA1PV1HyQZmme4LBA7Y1B/GMrDr5xY40StjLNMtx0clFFetP6gK40kgWosM
 sewD847ug2FPNs+W3LhTqhJ7SE1SwFufneE7QfmbM6oQaE+2rU0pU8dRfROhOfGQ1ni5
 hT+g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8WZvQeyGYRlo0/nwW+Y/kpt9DjvPODf+6P7FRQZv1wR4bkWCaaqLNBECX2cT8sWBJOdcPb/E4bOj0U@nongnu.org
X-Gm-Message-State: AOJu0YxSzRFsN27rBxZTrFKOU+Pni3raeLatinrMryCA7ia5by+o5jol
 gDcvCfjL1mdST2Bh09jrI/MAdRqAeQC0+e7ckbmCPlJk8tqjmeJr5DmEjvKdXgqcuymvhhGKqtU
 IbbiIDaJJB+r6aQ0cZH1DlEJMPIR3+jAHRg9BATs=
X-Gm-Gg: AfdE7cmnFELAd4aP6v9adUKEktm5Dg5I5NxaoTrPgQni3mEg4e6zI8OFTxqLn7DFvuN
 uhWfxRTsDxyRRdausVgLyPHCxAc/sKkEqOhiv71y8rnHRT4D2nKNfDumIfwhBTHt77NJ7925DmM
 HWF+hYAkmwJ0No5RRxiusVVyWo/TzxQVP2eOX+vBLxJtA7W3EdN10OEDD8vWZ46ydQHo/CGUAOg
 sL4batDpJFIR5Cz7i2ustAdVQJXYqV9T1w4UufWrQeIXl6UNseVjRyCnpY9JoT0nUiXSeqgVoKH
 ctKzGI6pwTEjB9//r/kcPjnhY7JPIGILsdkBuA==
X-Received: by 2002:a05:6402:28ce:b0:67c:a6d1:c48b with SMTP id
 4fb4d7f45d1cf-697022d41bemr4649293a12.11.1782097413182; Sun, 21 Jun 2026
 20:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_CA380CBF4A98C990C07BC04A9E748C438309@qq.com>
In-Reply-To: <tencent_CA380CBF4A98C990C07BC04A9E748C438309@qq.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 13:03:06 +1000
X-Gm-Features: AVVi8CfbiBIH95SiFdJMriXuBjhtsb-KTXtSRIbLlfZ3IIY2HRZRrBki8C8q-8Q
Message-ID: <CAKmqyKN09Ut3BAnUpF4Fen=DzMcT=sNpGjTHa8yPeu58H5EpDg@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: raise access fault for Zicbom MMIO-like
 accesses
To: ZhengXiang Qin <qinzhengxiang@foxmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sun, Jun 21, 2026 at 10:48=E2=80=AFPM ZhengXiang Qin
<qinzhengxiang@foxmail.com> wrote:
>
> check_zicbom_access() currently treats any probe_access_flags() result
> other than TLB_INVALID_MASK as a successful access. However, a result
> with TLB_MMIO means that the target is MMIO-like and should not be
> treated as a normal cache block management target.
>
> Raise a store/AMO access fault for Zicbom accesses to MMIO-like regions
> so that cbo.clean, cbo.flush and cbo.inval do not silently succeed on
> non-cacheable/MMIO-like memory.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3501
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: ZhengXiang Qin <qinzhengxiang@foxmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changes since v2:
> - Add else before the success path for readability.
> - Keep fault_addr as target_ulong since CPURISCVState::badaddr is target_=
ulong.
> - Add Philippe's Reviewed-by tag.
>
> Changes since v1:
> - Use a bit test for TLB_MMIO since probe_access_flags() returns a bitmas=
k.
> - Keep Reviewed-by tags from v1.
>
>  target/riscv/op_helper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 81873014cb..50fd1b73ea 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -218,6 +218,7 @@ static void check_zicbom_access(CPURISCVState *env,
>      void *phost;
>      int ret;
>
> +    target_ulong fault_addr =3D address;
>      /* Mask off low-bits to align-down to the cache-block. */
>      address &=3D ~(cbomlen - 1);
>
> @@ -235,7 +236,10 @@ static void check_zicbom_access(CPURISCVState *env,
>       */
>      ret =3D probe_access_flags(env, address, cbomlen, MMU_DATA_LOAD,
>                               mmu_idx, true, &phost, ra);
> -    if (ret !=3D TLB_INVALID_MASK) {
> +    if (ret & TLB_MMIO) {
> +        env->badaddr =3D fault_addr;
> +        riscv_raise_exception(env, RISCV_EXCP_STORE_AMO_ACCESS_FAULT, ra=
);
> +    } else if (ret !=3D TLB_INVALID_MASK) {
>          /* Success: readable */
>          return;
>      }
> --
> 2.43.0
>
>


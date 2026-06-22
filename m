Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CF8CD98F0
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 03:02:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbUuV-0003KQ-IH; Sun, 21 Jun 2026 23:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbUuI-0003Ff-E1
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:01:08 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbUuF-0004ak-M4
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:01:05 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-697564cb69eso4161449a12.0
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 20:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782097262; cv=none;
 d=google.com; s=arc-20240605;
 b=FkdCo7GzPgvnXUGeHxraI6D/EJnzuX8pqS3d9yXEK04aCiTC5Ijtv3YBtYwhaYwFwp
 nnnaQrC4tVzfcGFATV4cTImeLYqb6OL3E3eA9gH9DbFlamsHzgM63qVszgibdsqDuHVS
 HeET/TR4bHR3ugsRPbeEri3LrIzLh53nQcnvuCffnFX/F+sYl+k27mELQpPl/gSvzBKd
 OGEnyEP0//kB5S1tgxLzgIxQeJSFfA3K5oyr5ZPjA+Nf0o8kONgcvsA19cMBwD7jcraR
 LwybYJiDct8HAhtnBNm1jKuVd4jVAQtuUGoU2RAPfeCvQGiE+yRHl7v2iZKRlJ0dyVgr
 FaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=SGmWPYONqKaS6ZkXGsQTPMxd/hMHmErX0JzpBe3KCkc=;
 fh=qTUurphut3f3CW0KWcG0yAyao9N7iJ70f2wZ1xYzLXI=;
 b=VNQ3MRDKwtzx6rHrf5/LHNjeYiczU3CE9BDb0tIbnFvJDgaQcskKQFvhI5hDfUF0m8
 J7iCTxZfVsfCLs3uT1sPKxfDVcsXqHtr0FX28wklgJI+IbdFQ+CjeMiWtEgw6VoMyFKV
 Ojn1lgDkBiq7PXRqlPwmNlD1YW/JcBbq7ihsPgo1zWxivRC7uHSwsCZ5CHps+m7af7ax
 7FXQRBt7SBZpN6ZoVNuZKAXkuLj+QNkC1mL7V/7rTT595BCk/Yp5gfVeHFGAJ4pv4x7Q
 QJ1S8fP7Xd9latMt+99S0X1ViDZ/MqcWpj0CkGTagSRhnnN44Wg4L+ZeVUptxV/0kmrQ
 2RtA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782097262; x=1782702062; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SGmWPYONqKaS6ZkXGsQTPMxd/hMHmErX0JzpBe3KCkc=;
 b=fbTG5t+WHmPOG6Kr1El5fSxPEx2u3DD+iFgJBIR5FPFKmDLGm8s3Ol1LzlSscKfy4g
 gl/IyJzpkZLhKO7YfRyV3D3hDeqz9H+8jD0pGr20SpGLs6ia9308JLFiRNSF+ZhgUZT8
 C8oJ0sXHv/EQIBpRfSJLeHK6I6Yevoo7+F913QTS1x4RdAwroyVxocv/FZELJ8qDkmd5
 vSqKh67fJiNDEJz0dWZednnRMNmzObAHmrOI0jBelkySYzSIsFdXUTa7C2A9fxOoQNQ9
 6lfNvgOnJ5x6Zm925VNvRJf6VydKiVIubuyMeAL3nYZg8oTxGVjJrzB8Zkd5nRQp+c1K
 aeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782097262; x=1782702062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SGmWPYONqKaS6ZkXGsQTPMxd/hMHmErX0JzpBe3KCkc=;
 b=ZybF7egVIPUTeDl1QygzmfU83IOn1SL60yV9uIGg68xNwFPK480+tYgxd9k9+PozuJ
 ukyyL/f1cYWcU90b/5gI8g2WvxlUCDrxkCpiatHg99l+MsSABbp32xYypFN9jejCufE6
 0s+YrWtQ9jBjMj/kLplTI4Vt7W8SewcR2808bgUBa+cy4nSvY8k6iAZhvWdmSKpt1gnu
 R0xsQ6ZXqdiy1879NRzpnL6CIhXGR4ITBHKhevbTcCREt4UlVc5H3UaJlWsaDbjXAQ2v
 bTKDddeCoZr0XGKboCuR3+krlFzR5H6Bahw83y2HmZpPmxt5hEbzkQsXTy6IrlJQQeYi
 iKBg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8AtdQoHsGQ2OpNJgOxyDeOxzyUsdAElSt6u3VK8dvvn0NW8ATPVTcRzpcQT+3HCvscs5bNfcprfehW@nongnu.org
X-Gm-Message-State: AOJu0Yy2RL+M+g7v5shvFSInJ0Gb7w2t4flzX6fC7WDqV+zfuwqcpv1S
 EOzMTN8n7NtaBrcFwLeElVUwve+IAlRqJDLEQI3+ABVkt9yYOLGAVv8DAdnPFSFD275XLQws66x
 JFUv2qjd8aF+yH7beWfa5BX5Xc9dBGtI=
X-Gm-Gg: AfdE7clYT4XQVGuKLDiuPIt+owJUpf8UrZTgheQADXjjOfhWerOI/OXGdJELXw2c7tJ
 NI2BMZVYRUWUUO8WMUPxSUAbLn33W5/Wqr9mGSUHqHYEEkAoRFDKKrbIk8+k7g+R4WIIp+lcwtf
 mLgBpRC8icPTMRObpmnktPGlCqpoHYdiNJuQ02sd0CJXiZWRjp2dyarRhLwEC5d424OWXS0PA4O
 RotoVdxjQJt5q8ZFQd+2e8+Janmyia8lkOlIjq4sOujIf9tQls+LHKLQgF+FCn8dLZ/kEfU9xxv
 dtBLD0OWe05b8s04THtKwXx3pNg=
X-Received: by 2002:a05:6402:280f:b0:697:a037:8dad with SMTP id
 4fb4d7f45d1cf-697a037903bmr1389615a12.28.1782097261789; Sun, 21 Jun 2026
 20:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_CA380CBF4A98C990C07BC04A9E748C438309@qq.com>
In-Reply-To: <tencent_CA380CBF4A98C990C07BC04A9E748C438309@qq.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 13:00:34 +1000
X-Gm-Features: AVVi8Cc75Q-8Ht24soZuaja0o9vwvsRPHeDfAhrLTah2lYGZvKTbrhMmkWWfjts
Message-ID: <CAKmqyKM+=1YOv7avz7uUSimS5PqXp3hO79Z_FS3ww_rhFASVAg@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x531.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F69CD6E57
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 00:55:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUZtB-0003aA-8H; Tue, 02 Jun 2026 20:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUZt9-0003ZW-Bv
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 20:55:19 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUZt7-0006XG-36
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 20:55:18 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-68b90fc6a1dso303523a12.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 17:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780448115; cv=none;
 d=google.com; s=arc-20240605;
 b=cGKfwVf8JLPBWSMPE3Cjgn9u6XTTN2GBZM7FlZvSZFB3vQI0KU7Yeb6AUg2ZjqHd5o
 CtULkI+3vi+Rx4g1os263u7zZ7KJ/yF7yGaaeNWZgl4jPvfSs6/oG6hv4ifA9WSdxCui
 3msVwrvIbACcAl7PcDKEtlUUluszURs2SKNtqCKdnmxaxaovXl55WII2yO37CxLuAeFL
 mGqBOpoYo4FKEKi9P+0xWu++eOsACcmjTP3kk62bqk0ASC9N85Nf1ixTm7jusajjJI8w
 sV5FaLR7REveba+R18YgnI49meohC9hEJtdzbowRc/Ym9I2hcaUm9cZNzvoLhIWl1Usa
 V92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MfCaxHxJ72Sdk5cHzFNp6GKqyBD5CFoqX8Dk1uv/XlU=;
 fh=VKejwRBS1b0XlG0gwWCrvUVLkw0iYRmtiyyRT0xrE4c=;
 b=Bz1OH/XonfhGZ7OJEjdMWBM+eA545Q+cvAOgSUm1LvQ7GPhuAFEaP42F41/FrzLkDK
 3cd/WVTnQe0nh58QA6SYwRAe3PFkSA0MZt0nzWdKtpUdog3E8yP1Gj/3Rwa4Hl3BWWx6
 qIR2CWAg0JPtYR9Lu4rrgmYQ0OPABc9pr4X1tm0UM79vjTQ2lpAR6IMvkkxIrnneJE0C
 e2A3o5He2LL6MHmZUzzhwmEWh7E50FMzZQJ7UWW0x0aRG9N3E6T68dw93H/GIVOSmJjp
 jV2nONlrk8s4fLaup2Et32dgDfXdfPusdQ+YVU+0CHosa7QHzFIp585ETCgXn05HoEzg
 eZaw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780448115; x=1781052915; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MfCaxHxJ72Sdk5cHzFNp6GKqyBD5CFoqX8Dk1uv/XlU=;
 b=hXQdmw0krP9hFuTi3DEuHIYkIp/Syz7vVIUNbvXgkDk6mKYwUzRHsO/o10abhje8ow
 nuiX5T8idi1mHDnsfzJcOIrcwhV0ucV9UvZ3reuqzvQzWsobOSI2ASzt17QQOD9Fn+m7
 cHRjXyJ5SLO4gh3V4QDRZUXixxpjBC79aL7cLSsFd7mmhn8LqojhgyJhNkQdkMtM7bYz
 DU4hR9qcC97gvUMPkgCz5hKhqQJaqSWFNN+IoSL7cMIghw+oSvzZT9X2nw8bI3yTHzDN
 3CB5kTTCYWBxZwayQAHuHeYRyLYK4tMXCsKrV3jc0iTvKrXr2xxwyfqTs9+mnQ6PdiOz
 ZWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780448115; x=1781052915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MfCaxHxJ72Sdk5cHzFNp6GKqyBD5CFoqX8Dk1uv/XlU=;
 b=oWC+zdSQRNLujgekCfD6H5d+Vo95KI49HuhudYDC5ZKfWsH59QVenVpXAV+/c6EoAR
 M04ZwEvKsZl3gFN17eI+aDvU2q4kOWm1KrWrgSXKtsbTuR8cwCL35iqbGk6aR6m7MRgk
 UiH+cbdTex8zHQzGCsazMSb/v4Z5+nSoBc1CNsGaIeQMsX1LUnYg+nEZFpq2cis39wXK
 67r8zAVhYlU99HevBM4KQ/iCZSb57QVWJkrhet9FX1TUaw9hpVZ9tSpn7KIKfiFnLtUv
 86tP+NH8zxH48U86OQS8sgrApc3VmuSFy5j8eP3HpXXESKQ1RTMHEItBBHAK2n8AFokO
 7UEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+yoxVUhAzcWgmnF7F/BRhIplAf7KujMM3cxdjfiqfgsIi3pZ+B2SMZU9BtGKCkVi1FLHAfdkDlI/N/@nongnu.org
X-Gm-Message-State: AOJu0YzXtNHl10BH9hmLtMVUIGQGJ7KwJy1QU9yfJ4YSfPMLYn5CHHnG
 x+QI2g4CPSqpsFOk+0ZvaLk7E52jCKQ9YeVbuMkT8WqFUkYQC2ECN5iVv/iMzwK/kF6Bh7V3G29
 AoX0Kp11XlmSJwi+Yy3CJI8EiVKbHWgMCaBtF/SY=
X-Gm-Gg: Acq92OFeAk395AkEu1hi2bRBIpvCGzf7SioMRFcWKAKJLe0yz8zMkO81ahuxEMVMETz
 hxF3INGS5OiRxGE+ArJ+W5Wa0i2m6dhmqW66Vqoyru8YXxDdiegMGOcORLXAe1xPicvgCuiikDR
 742vNfc3odBu0ED30c4Xe0c+9JERk4VTe6MuybBPFA0D2/T/FL4+uOF/ejDz9pongew2n6lvsYJ
 5i91WGdVpGbCfiaJFczUpnd40/6vUbzetlQGHWESXdVlAVOwjjzGP+mvQg6DV4rcojJO+khQNJi
 3iy2SCPWelvmTyw11r1OJV61sGKwwt4SN26dZebJ+QSEjXy5
X-Received: by 2002:a17:907:270f:b0:bc1:c4d:cc70 with SMTP id
 a640c23a62f3a-bf09c6a5855mr33102966b.2.1780448104295; Tue, 02 Jun 2026
 17:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260530102100.78150-1-314abh@gmail.com>
In-Reply-To: <20260530102100.78150-1-314abh@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jun 2026 10:54:37 +1000
X-Gm-Features: AVHnY4I8CP4BueHDWA7d92YG7A-LD61fKhgdAd-bIKyay25mwyFhXjTtW2dgk28
Message-ID: <CAKmqyKM56VKARehfTCqkre2XvgWs=+oHRWQQmS4gLM83JHrW9Q@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: mask vxrm csrw write to the low 2 bits
To: Abhigyan Kumar <314abh@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, May 30, 2026 at 8:22=E2=80=AFPM Abhigyan Kumar <314abh@gmail.com> w=
rote:
>
> Citing the RISC-V specification:
>
>     "The vector fixed-point rounding-mode register holds a two-bit
>     read-write rounding-mode field in the least-significant bits
>     (vxrm[1:0]). The upper bits, vxrm[XLEN-1:2], should be written as
>     zeros."
>
> QEMU wrote full value into env->vxrm causing read of upper bits too.
> Used existing macros for bit-masking. Previous had a hard-coded value.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3470
> Signed-off-by: Abhigyan Kumar <314abh@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5514e0f45..7b98d66db 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -977,7 +977,7 @@ static RISCVException write_vxrm(CPURISCVState *env, =
int csrno,
>  #if !defined(CONFIG_USER_ONLY)
>      env->mstatus |=3D MSTATUS_VS;
>  #endif
> -    env->vxrm =3D val;
> +    env->vxrm =3D val & (VCSR_VXRM >> VCSR_VXRM_SHIFT);
>      return RISCV_EXCP_NONE;
>  }
>
> --
> 2.54.0
>
>


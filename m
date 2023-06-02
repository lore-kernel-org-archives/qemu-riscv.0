Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98111C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 03:14:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4vEn-0003Ov-TK; Thu, 01 Jun 2023 23:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vEn-0003OV-3U; Thu, 01 Jun 2023 23:14:01 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vEl-0008IY-Mo; Thu, 01 Jun 2023 23:14:00 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-7865ce76c6dso515240241.2; 
 Thu, 01 Jun 2023 20:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685675638; x=1688267638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UG9mfdenaqd4PErnkgg+4NsYNQvfxxZX9AVq5d1gwk=;
 b=I1hPVHguPvu0WekKhVnJFZ1T7nRvOlhw3WhEMywYAWfNtncAVYoalup/hWCCH/Ni0+
 zS9VhXAMN2xQ6Z65kpYS3jD2Gql6kOzsZ4LIvceKfrhr6sQYJw/4xg8/QRfF2e3rAMoS
 ioDCl0BIvfnyBXT1gpXRkFpcGPRcC95P4/0561ntzwynRG9PHk1PpaKU9d1N/53whOtg
 WylnCzol0NS7OPE5doepWA2pZuqzs8JGAl4W2wke6uBPv8HUV90liEoEwiqCFHQBMJtC
 V3Wzpi2k+S1t5AYCOdc4xWYuZPWhkzRML0T/H1hki4exGo1c2UykSw5vjWORW6Ljp7Xg
 yg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685675638; x=1688267638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6UG9mfdenaqd4PErnkgg+4NsYNQvfxxZX9AVq5d1gwk=;
 b=chphH5e/ChFWonDtCDUfZrMcWj4np/7h/Nf6AnozmfDFrJ/W7gkGucORMor/tcjsuJ
 vr+Cu/RoJawZAoHxtFc50/bUQRFSlDpPaN9VyXBbjqfyzTk14EmgkT6+K288mFLMvzsh
 PjRqzl6KlIYrbGWj/S24rdfXejdMOID70rPHvXtI6xHP42/rDwdmnE+YTDq6MP2vzXk/
 bhcx9W19VevRmxCSy68gVzaLJvO2dX0vjah5dMg6Cw/dWNXJpDEdtDRFmZNDq+mMHCvW
 /hQCFCiQF8/zGFHdTI4mK0Mv/4HMLA1qX/j4asIhm62YWAdU3oB50vHZOI0V+zBrFCC6
 N1qQ==
X-Gm-Message-State: AC+VfDxgSJUr4rKb5qLkpIpvdC6XgV1uudydu5MxfDacJlE0yQFAC8hY
 BxFIFYnyXONzLuzQPp+MImu3MKrJkgPNu/WwQNo=
X-Google-Smtp-Source: ACHHUZ40odnQGSpS4/mNr+wzk2FbVVroBnl7jU8p8o40etOvGBP5xBYeCW6bopUjxhtOIFOK9kXZKtDE6DGminJXjxM=
X-Received: by 2002:a1f:41d5:0:b0:457:5285:2fff with SMTP id
 o204-20020a1f41d5000000b0045752852fffmr2212107vka.7.1685675638223; Thu, 01
 Jun 2023 20:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230526162308.22892-1-rkanwal@rivosinc.com>
 <20230526162308.22892-3-rkanwal@rivosinc.com>
In-Reply-To: <20230526162308.22892-3-rkanwal@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jun 2023 13:13:32 +1000
Message-ID: <CAKmqyKN1z3H4-wpY1SZLEDAu5EoMAg3zuvz9rydm-XNMujaJ6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] target/riscv: Check for async flag in case of
 RISCV_EXCP_SEMIHOST.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, 
 apatel@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, May 27, 2023 at 2:24=E2=80=AFAM Rajnesh Kanwal <rkanwal@rivosinc.co=
m> wrote:
>
> RISCV_EXCP_SEMIHOST is set to 0x10, which can be a local interrupt id
> as well. This change moves RISCV_EXCP_SEMIHOST to switch case so that
> async flag check is performed before invoking semihosting logic.
>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 57d04385f1..b25ee179e9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1602,15 +1602,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong htval =3D 0;
>      target_ulong mtval2 =3D 0;
>
> -    if  (cause =3D=3D RISCV_EXCP_SEMIHOST) {
> -        do_common_semihosting(cs);
> -        env->pc +=3D 4;
> -        return;
> -    }
> -
>      if (!async) {
>          /* set tval to badaddr for traps with address information */
>          switch (cause) {
> +        case RISCV_EXCP_SEMIHOST:
> +            do_common_semihosting(cs);
> +            env->pc +=3D 4;
> +            return;
>          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
>          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
>          case RISCV_EXCP_LOAD_ADDR_MIS:
> --
> 2.25.1
>
>


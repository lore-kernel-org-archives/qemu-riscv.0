Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F2FC3DA7F
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 20:53:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbnex-0000Dl-9v; Wed, 07 Aug 2024 16:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sbneu-0008P0-86
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 16:53:24 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sbnes-0001rc-I2
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 16:53:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ff4fa918afso2594315ad.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2024 13:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723064001; x=1723668801;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ry23dZpvgfwIGeM69SVq7QVTXD2LOCzrLs1ZslOFt8c=;
 b=VtVZqSElYgcyGnS8LXVIGvM7sMXCRpSqDIKGg6LlczB9cCj+l0OER9WrmFcJseszn0
 IbiUAgb1r8zYxi4vYJ34yUKA8OYNyJ7WZBo5QlpYBQmNpw0HlBM8OKyyyY7FR0J0eQj3
 lNMlcuITkw/4SK5UK5q6I96TSdt/Audirx9rP86vuFHsLKDd0uolkESgktiGf1iFIpbH
 93dpMnPZ+gjafRel1iadDYqVyKNGZ21U1dWTA5GFSa+ONleBHNFPszuUHIapyAsS0rD4
 3ImmsSqRQ1dk3aIn5mcNKsftqOikw5GzRRePjBFs/138182X6OIp1eFfzTr6j+19rE+O
 RYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723064001; x=1723668801;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ry23dZpvgfwIGeM69SVq7QVTXD2LOCzrLs1ZslOFt8c=;
 b=wjSM/WrlH4vGrkDRNBAhjVHt7d9A/C1DnYrq/9AYb5PeHQRJK1kxY8FfMt+E535mcm
 WEJ6oc4iz1Xo4G1SIQNQyNkkG0Rs1vzytEbWXu2I+Yg/CrnId72JWKdgWMN7GWGa9bfV
 HC/Jss7q3Gz0usvBlbfB4xpiG0dce4jioJdhgukaXTr9VFXnfwyL0Or35F5sG7wbxap9
 vgSa/SF52V6V5j3rlGNwrZH63JmY3IubCadeQ++jY+k+pgK8Qr16IWGWV0+hHeRnxnJO
 /3IDnhxCtwU7LGhIoQkmIVcP6eNu/xtTMSCrGBZzPG9doEcDjYFFLT/KTTCwl+RAq+YF
 RKwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ80DKUhiJ9TT/V5HOeFErjEWdMadULBSNL4hsq5PO9nVX2/XPJg+JchLcVyCZWaojh9+qFy5HNjf/96bXKanTDBi91y0=
X-Gm-Message-State: AOJu0Yyhz7Aa2/Ns2iTyh1OwYAg6ZDAYH5NnHjnnWEyt81x/wZv/qW8Z
 yA3HRlgi9I74KpwP9HpXpTvUqbz6MEN26LkRsSwh8VTK6sAUL/ysc3DSFC0HrTU=
X-Google-Smtp-Source: AGHT+IG90yhYC+NeKw/AYdwX7hin6FMDAv5z1KmJWScVH2/dKDBLSMYKcQ9s8eZ5JlWqvRvioUMg+g==
X-Received: by 2002:a17:902:d2ce:b0:1fb:93d6:9fef with SMTP id
 d9443c01a7336-1ff572ecfc9mr216053665ad.38.1723064000966; 
 Wed, 07 Aug 2024 13:53:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f19efdsm110404715ad.31.2024.08.07.13.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 13:53:20 -0700 (PDT)
Date: Wed, 7 Aug 2024 13:53:18 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Jim Shu <jim.shu@sifive.com>
Subject: Re: [PATCH v3 19/20] linux-user: permit RISC-V CFI dynamic entry in
 VDSO
Message-ID: <ZrPevkJmO3OUouin@debug.ba.rivosinc.com>
References: <20240807000652.1417776-1-debug@rivosinc.com>
 <20240807000652.1417776-20-debug@rivosinc.com>
 <7bf932f1-661b-4854-b26a-954dff70ba48@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <7bf932f1-661b-4854-b26a-954dff70ba48@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Aug 07, 2024 at 01:36:34PM +1000, Richard Henderson wrote:
>On 8/7/24 10:06, Deepak Gupta wrote:
>>RISC-V CFI use new processor-specific dynamic entry in ELF. Permit it in
>>VDSO post-processing script.
>>
>>Signed-off-by: Jim Shu <jim.shu@sifive.com>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  linux-user/gen-vdso-elfn.c.inc | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>>diff --git a/linux-user/gen-vdso-elfn.c.inc b/linux-user/gen-vdso-elfn.c.inc
>>index 95856eb839..59c818eb11 100644
>>--- a/linux-user/gen-vdso-elfn.c.inc
>>+++ b/linux-user/gen-vdso-elfn.c.inc
>>@@ -273,6 +273,13 @@ static void elfN(process)(FILE *outf, void *buf, bool need_bswap)
>>                  errors++;
>>                  break;
>>+            case PT_LOPROC + 2:
>>+                /* RISCV_ZICFILP_PLT: for RISC-V zicfilp extension */
>>+                if (ehdr->e_machine == EM_RISCV) {
>>+                    break;
>>+                }
>>+                goto do_default;
>
>Documentation?  This symbol does not appear in either llvm or binutils 
>sources.  I presume this is on a development branch somewhere.
>
>The comment is poor.  Notice:

Noted. will do better.
>
>>              case PT_LOPROC + 3:
>>                  if (ehdr->e_machine == EM_PPC64) {
>>                      break;  /* DT_PPC64_OPT: integer bitmask */
>
>the ppc64 comment describes the data payload.
>As do the other comments beforehand.
>
>
>r~


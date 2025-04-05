Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2563C3601A
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 09:19:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0zfe-0002Hi-7w; Sat, 05 Apr 2025 05:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zfS-0002BX-Tl
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:18:24 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zfI-0008Jc-Bj
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:18:21 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-223fd89d036so33040295ad.1
 for <qemu-riscv@nongnu.org>; Sat, 05 Apr 2025 02:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743844689; x=1744449489; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yv2TWUYQLQeoiSpv6gKrRDNk/n3LqFS2id+9I6G8z/M=;
 b=RLEjovYC4tXSEw2ewHCS67I5jspvQfr4U7boFx1Fndt7huN41hJ+nwwJ3PITqOIDFD
 JOJdsj8FK7ZAc5rSv9jUiceyDOzcH8mj0DWWOZSDOHzeRF7uQQYlJ2oXJ0URvjwUsQHE
 2UmfxZYniKDHpQx0XgRqZH6/0ZqW00ZgdV5y67TgHPV2oo8ExU6HI18KgI3lvB2Aye0y
 BLdRyNZokyUnBJjDNO9YR8pvl48jLQH6p70dcWScmeEagneOqk6GDXVDCsSFOu3QlJob
 FxQIfnGl7ieYcVCr7q7LUj8myoPNnF7VVex8CAfM1pi+al4k9rnrPx8GfhDiWzB45lQg
 czTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743844689; x=1744449489;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yv2TWUYQLQeoiSpv6gKrRDNk/n3LqFS2id+9I6G8z/M=;
 b=nhJ7NUaojG6vkIMGRIaM/QvnIq0d6QggulTNOJmpjffnP/mZw1rRnD/eLLUvt7wp+J
 SDpzeclbpEZCQpMN5TxCwYEb08ZVyTSbZphDrPKQjsBOdDIxzqWsog4iGe9VL6GE11SY
 s/aW7bQ9d7lUVmF4EwR3uHqibdPwmTZroabmvoHL/676ojfb2vK6NIvPa306E/oVDTlS
 2WyLfFQ4kk/SzR2leuffyDx7ujp4UbsOQgr2uNuiODv+tbY0dIxlRFJpS5m/Ddl5D62M
 6a/tgu7W9QAbk4mfWf2j+JAS9L90hgvGk5z60FKdUeWoqlWJfvpxnmLkhGuG0u7o0SjN
 X5CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmIpWoi/ZdGdVPiKPIIZ499PO0XKqOS5AeaCLd3B7b0zGnzYxQYKGBhrHRqXgz7dAD0bheODC51lJ8@nongnu.org
X-Gm-Message-State: AOJu0Yx+tLPpNiEVWWJKDaiTfMHgqEWsvPTTh61Nmy2YNM/JBd6ZXR9i
 GXVcQLuboQdxsH/mplPnGr9K2tSQO1E19eP8eAkARPeyxUtjmBvc9jqvvszUmSY=
X-Gm-Gg: ASbGncswpG27CfcfqT0BBPKeTJBJ2BNbuuedBspjiMPS+LRUzb3xtv1O+AdA5yPDkZ8
 MwZpeufExirfP2VtOLKrOh9Np3/b0Z1FO4Cb2+P8FsQqIN02jtzjjo5UzG9v5RizzXQMbz2i2VO
 8XcuSUA86nsXvcwR7mHQfnB9ACOD+0iU0tpZcO1k2IWDx+vQAgDQb2jSc/a/htZwjT5JasJEjEh
 bhOqyqcR9dcDvYavsZwzbR0NSfIphD+xkSHlYnPA+rUmn71aJRDAZKqNWukkvXeMI+KrIWtMvQI
 Kl5B1s5alr3VTGb/pJv/tcvFQejMG32FZ1RwqPMMlc5ap843gopynuiJszrrZODnVws09eU=
X-Google-Smtp-Source: AGHT+IHTxUG7U40ve/RAH86Q537Elgt8Q/JR+DcaCWEnaXXXpLfF6sIH4l7H4vTKOf3n27ZE/MCHTg==
X-Received: by 2002:a17:902:e552:b0:21f:3e2d:7d42 with SMTP id
 d9443c01a7336-22a8a06a041mr81996755ad.23.1743844689081; 
 Sat, 05 Apr 2025 02:18:09 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2297866cd1dsm45582705ad.159.2025.04.05.02.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Apr 2025 02:18:08 -0700 (PDT)
Message-ID: <b3e843db-91c7-4781-9de2-4f6cfa178da6@ventanamicro.com>
Date: Sat, 5 Apr 2025 06:18:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] target/riscv: rvv: Apply vext_check_input_eew to
 OPIVV/OPFVV(vext_check_sss) instructions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 antonb@tenstorrent.com
References: <20250329144446.2619306-1-max.chou@sifive.com>
 <20250329144446.2619306-7-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250329144446.2619306-7-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 3/29/25 11:44 AM, Max Chou wrote:
> Handle the overlap of source registers with different EEWs.
> 
> Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
> Co-authored-by: Max Chou <max.chou@sifive.com>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

With your co-authored-by tag removed:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 3d02a2f9ec8..2282b89801c 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -433,6 +433,7 @@ static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
>   static bool vext_check_sss(DisasContext *s, int vd, int vs1, int vs2, int vm)
>   {
>       return vext_check_ss(s, vd, vs2, vm) &&
> +           vext_check_input_eew(s, vs1, s->sew, vs2, s->sew, vm) &&
>              require_align(vs1, s->lmul);
>   }
>   



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C71CCF9E5
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:21:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDNA1-00010I-Cg; Mon, 27 Oct 2025 09:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vDN9z-0000xl-C2
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 09:21:19 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vDN9i-00054X-CL
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 09:21:18 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-78af743c232so4139571b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1761571256; x=1762176056; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g8Q/30bUWm2O2CU+TjmYKHZVjlU36Cumj5zQfUBgl38=;
 b=fQS0Jr4vzFEo0OO9/bKhpOJBQW4jEz4XDaueUG3prMrSSirlnQJ0zbPmgzAP0OQ3lu
 Uyoe2RPfJriVO2ntnbZ5Gyt71MsayFSY7hIE4t76KN5pgki+0ntho9LIKlTMlwKS5V56
 JvQq7GAlXHaQyVo/hqL9QFBA+U88pqpcfLJenTcmbWGaxKpmaASwZ0oGLYoFdTFQApeY
 NodDZ8TZw7qZjJINrsktXU/lCkJkK3ud+UHw0/DqQUdYVKfbTQLRe+jG464/RvKLFPHs
 airUOTw2lIcKliuxB/5gPchrWPucAJYgJdNncLfuR7o4BtmMX2UQlEYPgwFaB5sTkt9C
 lFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761571256; x=1762176056;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g8Q/30bUWm2O2CU+TjmYKHZVjlU36Cumj5zQfUBgl38=;
 b=ZYrcvj0Ce+99lpU6ZEWOsTn7biLDQOlRTARbjhCNUdxzqdyI7JivBhNUAgigWhhl+I
 SmTlWvrYjng7ShjCwC3OUeW4jeCZbYvcXeGmZo21uEkmk4bzB9Yj25E1aulrvQeHJxb4
 o367/9POjAYS7YNxRpOUapmAgdvXQ19uoH0c+/6iD+z5teusCRfr1oLA+K34YdKaGnUu
 gXW8kkLUu/DCgQKb4tumq3P6wY0mXE+QS/GXoRODIYwCRDOoVaUJdqeSXruqNRgNN7lu
 BKmJx0esJrLR2KAkEHuxa8WfkBflnuybXsmqJnplV9NGABhQenBsq52lqCM+G+lueD51
 7bjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBnchI/2iNgCqmY/HSqBauaUWBC2Jk+ZSdJAt8cjKf49Kwr/MavkaQ292XhyX8pR+QbFyeAjJ8wIrc@nongnu.org
X-Gm-Message-State: AOJu0YwtIJiJBe8pMMw6oJRUuCPIXeDWH15YJadDijG0gjiSfQhZwiee
 1+DQuX1/3Pj5sYvXg42IdyfEr05CyiGhMdH0Tk5MD4UmhJSrasDeIzEt1hpGptZbiVo=
X-Gm-Gg: ASbGnctlNP7IF0lfpCSmUitSe/GTHSoKP+eSRSW3kN7KkMaYRpoz/qgf/HZbhGYicdB
 eWLPlnERz/DKbaWj+KRFEn5i+9fg/5sLE/L6QdtGqsNfW63pVSed7GgZ6HDiMcpmeuA3z8DuGd/
 e+dHkQZPrriGlC0B/WCQhRhAtZ4dL2exfdK88M12ItmSUdcI//uuZ/UU1fnM6MXOsOsIbuCzWBo
 iT3g9N2dQnirrt+RWhnCmpNTb5UGnWGuVYwCpg7qxDzaUfzs5h9B8fYDd1IYvVRkEvkabbjcQnx
 UiG9SCd96UYShDOqvWZO2sU+Vg+4ItNS7GnG4KKcOwwre3B062N4a7q9pGIU9D1neS0VL+b4Wur
 pnITOrVQ6PIon1L9mNltNfHj1P6sR1gGxc/ussSeW1gvhw6+u2/Pcir7ycgYTK0OfzEiJGBSfsT
 oBmzEsOZcKG2XP/01uQdLg0ig=
X-Google-Smtp-Source: AGHT+IEFaUsLRDHzdFEW1FTVJTg6Zu8WHr5LIy4QXPlo5vm2eWFv+tazkRop8FO5HtkxIBUgO4B9aw==
X-Received: by 2002:a05:6a00:228a:b0:7a2:7610:364f with SMTP id
 d2e1a72fcca58-7a28688190cmr13165060b3a.29.1761571255978; 
 Mon, 27 Oct 2025 06:20:55 -0700 (PDT)
Received: from [192.168.68.110] ([189.38.141.22])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414012c40sm8347826b3a.6.2025.10.27.06.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 06:20:55 -0700 (PDT)
Message-ID: <934bc46a-6a86-4cab-8cbf-c98a4cc92ed1@ventanamicro.com>
Date: Mon, 27 Oct 2025 10:20:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/riscv64/test_sifive_u: Remove unused
 import statement
To: Thomas Huth <thuth@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20251027112803.54564-1-thuth@redhat.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251027112803.54564-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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



On 10/27/25 8:28 AM, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> skipIfMissingCommands is not used here, remove the import to silence
> a pylint warning for this file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tests/functional/riscv64/test_sifive_u.py | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/functional/riscv64/test_sifive_u.py b/tests/functional/riscv64/test_sifive_u.py
> index 358ff0d1f60..847f709da12 100755
> --- a/tests/functional/riscv64/test_sifive_u.py
> +++ b/tests/functional/riscv64/test_sifive_u.py
> @@ -13,7 +13,6 @@
>   import os
>   
>   from qemu_test import Asset, LinuxKernelTest
> -from qemu_test import skipIfMissingCommands
>   
>   
>   class SifiveU(LinuxKernelTest):



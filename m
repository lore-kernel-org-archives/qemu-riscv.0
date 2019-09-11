Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8BKq-00060W-7O
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 18:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8BKn-0005zu-P1
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 18:43:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8BKm-0001w9-Kz
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 18:43:33 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:41785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8BKm-0001vs-Er
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 18:43:32 -0400
Received: by mail-qk1-x744.google.com with SMTP id p10so4543241qkg.8
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 15:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UXX/qWLQ5ycH4sZQZ9cy32zhc9QaUh8qQNvutkmxdtE=;
 b=kwMZGq8pILPcFt+u6kRA8RaW/vTgTea90FImVJXniP2jAJnad0Z4IvU24YR+A6JEVf
 vvmh88+axZ4aJdU6df4KTuxMqjOgaiRWnJU/CQV+/U5n21Gb79pSmJWsZ4mKV9r4VSXd
 HY/Xb86SPdzE6IAMaVGK4wM2HVXCXdCPhBW4ZaJLzViOqDwEXiuyvF1VA9UCxkOFPWtC
 A2alTBktqJ1Qg9Vppy8/Xx6pzZPce1RiDbeQZQxJcCva08FDjDdqoKbtsRm+qqeZA4Rv
 gx7AB5uEB1O7k0ZWKZLEa9oL2eXS3ymiCNelkw6wUFufiNr9n1KjqgiX+6b+VgL26ADj
 XqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UXX/qWLQ5ycH4sZQZ9cy32zhc9QaUh8qQNvutkmxdtE=;
 b=DxE7zOpnnuOQ8x0h5bVpTUQUQXxRqI1jhhVS4QjrLyaoEXrEslvaCzePZ/IApk+NV9
 aI7R+pil0WqzR7r74edYiVde1L8nXqmZRMJI4uYXYTl9FD5zO2VcZKo/AKf+OBQPRxVS
 VuFIz5sHeLjeaWxnvGe0ovhPwAg/JHPoYUo74m2OV8AEuu9MMMa0mDkx+8/k8baYemSq
 GeHUQ3dcuI/yFrgJPiZ1Hf/mGFaM4mcDLKnVS4nd72GywdE3zP39AKSGBN2JQgrf2438
 mO+GGrv7L11EIz7W4ws46CZU90qxt64yy+kBshNN5HW/WvmZQqdzJLEnIosiQ+UofDTm
 U8kw==
X-Gm-Message-State: APjAAAVEcy28ijyHS6MU11ljxOSEWBVAwLRmRW8RsXQEEXKXPDh/kNBP
 ObCB7QjdfrSaJwgJa/XalFk5eQ==
X-Google-Smtp-Source: APXvYqyOkYNvImQ/6HX/nWJPau6lz1m98sQYer4e2ccREQVgMu/Z57nSSpIdAT2IIoClKdTJCgLqBg==
X-Received: by 2002:a37:a704:: with SMTP id q4mr20073701qke.385.1568241811811; 
 Wed, 11 Sep 2019 15:43:31 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id p199sm1582680qke.18.2019.09.11.15.43.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 15:43:30 -0700 (PDT)
To: liuzhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 riku.voipio@iki.fi, laurent@vivier.eu, wenmeng_zhang@c-sky.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-4-git-send-email-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ac250aa8-886f-befb-070f-2f5d10861e39@linaro.org>
Date: Wed, 11 Sep 2019 18:43:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568183141-67641-4-git-send-email-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 03/17] RISC-V: support
 vector extension csr
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2019 22:43:34 -0000

On 9/11/19 2:25 AM, liuzhiwei wrote:
> @@ -873,7 +925,12 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags      },
>      [CSR_FRM] =                 { fs,   read_frm,         write_frm         },
>      [CSR_FCSR] =                { fs,   read_fcsr,        write_fcsr        },
> -
> +    /* Vector CSRs */
> +    [CSR_VSTART] =              { any,   read_vstart,     write_vstart      },
> +    [CSR_VXSAT] =               { any,   read_vxsat,      write_vxsat       },
> +    [CSR_VXRM] =                { any,   read_vxrm,       write_vxrm        },
> +    [CSR_VL] =                  { any,   read_vl                            },
> +    [CSR_VTYPE] =               { any,   read_vtype                         },

Is there really no MSTATUS bit to disable the vector unit,
as there is for the FPU?  That seems like a defect in the
specification if true...


r~


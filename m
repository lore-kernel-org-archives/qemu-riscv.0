Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1XZW-0006WN-Er
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 12:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1XZV-0006W4-Tg
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 12:07:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1XZU-0005mX-9q
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 12:07:49 -0400
Received: by mail-pj1-x102e.google.com with SMTP id t15so8088424pjq.5
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JqusPMVwspv4Mbzv6MdgywMMzdu2xeyDveR9bZ1l81U=;
 b=kpt9EKsMnbdviHMolUdAom6AmCbBNcP9hiL2xUM8fKQWSR28QCooaQSNTtcBnmmmbE
 nLIo6OVb3S3MTxg3HB0djaWifIqvNbssJ+Bx6IczGFvDjXCXmllZtDMJso45MRrYOUmq
 vseWnhroC0aj12jvmJwnjfIjtdcNQs1or/LGwvVbCOCFzxZ6GYCzuWUAcYZ9hlzb32Ba
 UzlRg7oEhqUIqvIr6iiRT/iqIKIRcGSl5SuotkYnIqtfDg5z6Yf0CCUZkR5AqHZS9l98
 Obw+81GdqVKIG2YOD3rFt0dy5qY2BOybipVO1OZlNpAcaIwsUFLxCSF73t9s0Y+MzcdE
 gXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JqusPMVwspv4Mbzv6MdgywMMzdu2xeyDveR9bZ1l81U=;
 b=sYPsi7mK+bjIySbnWk28pzpc3DeYb2RF7gpQKQYWLA8BNxuXWURTJmHLFbBencSemE
 QDcTRKPbQFGtLH9NK4i78AxHsJ6Z3EsFNHPagbzu29uk6yXFRpYZR5fbZLxKMrNq2ZXL
 TJ4TUItxV3Ckf3bfQQZYPWC69fD/2SVsmeQrjChPRDxu1CajGneXKg9NdtRqeWVlryI+
 BOFUZbslt9j+m225tNlb6tjN185XF5PubfZwRcFrJrCQKtvtNivZ1xOo31l7pfiVfYVB
 k/wT8oeMekYJt0Bi7LpO1e6AqzNHafhsY8JbKOE2H5pSQ+LupB5FfOJ+03M3XAgyD8jF
 U0RA==
X-Gm-Message-State: AOAM530V4DChU7/IrpuoxHMLX5iuk2XQzSsGqUXSONPIyxipFsU73qEc
 4stIT7My5yIWAii4J8hfTn3Sdw==
X-Google-Smtp-Source: ABdhPJxRRgxX7SAQUsB9zDoebUrxdAv59vZNHge+kTWMirVIuWwzG0L3ZMLf8IaK0W6x80R0WjY4fw==
X-Received: by 2002:a17:902:d303:: with SMTP id
 b3mr4335863plc.101.1596211666776; 
 Fri, 31 Jul 2020 09:07:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id p11sm9566582pjb.3.2020.07.31.09.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 09:07:46 -0700 (PDT)
Subject: Re: [RFC v2 60/76] target/riscv: rvv-0.9: narrowing fixed-point clip
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-61-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7dffddb-921e-7156-a3e1-030615ff1d28@linaro.org>
Date: Fri, 31 Jul 2020 09:07:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-61-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 31 Jul 2020 16:07:50 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   | 24 ++++++------
>  target/riscv/insn32.decode              | 12 +++---
>  target/riscv/insn_trans/trans_rvv.inc.c | 12 +++---
>  target/riscv/vector_helper.c            | 52 ++++++++++++-------------
>  4 files changed, 50 insertions(+), 50 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


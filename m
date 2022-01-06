Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5Ync-0000Ir-Tl
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 14:51:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5Yna-0000H9-Sz; Thu, 06 Jan 2022 14:51:46 -0500
Received: from [2607:f8b0:4864:20::1030] (port=36557
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5YnZ-0001ke-BS; Thu, 06 Jan 2022 14:51:46 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 c9-20020a17090a1d0900b001b2b54bd6c5so9768976pjd.1; 
 Thu, 06 Jan 2022 11:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0sCHWHz2FQArWO8NWOc+SMDIT9sNo9CQt7F1jNlLsEo=;
 b=opv2ilykRqYEAQsY63rwH7w00A5CgB9JYyvViS96JRHnYqzzGblGyMQxy344Z5/k/a
 +E5L2vdr+Ltf0izmE5yPOy27r0pGZl20xl8Qf7K1YOQgj/FbxggLrSvm18wySFxTh8NM
 N4w9iXbJZTfSMTq8q/t1ceJzXahkFfyzKlUWl1omtFw9nF3ZPL5shtR16+AWZt4OlNaU
 NSEDIQTfca/tR3sXtoDhjIaSLRhm9Y13kXX3vQATz0iqO5n6j6mQyEy7o0IUJ3PWwNwX
 ySkXap5Fxql3yBB2ieReUAVGOSRax7zyKIiNVpwVKxyGLHIWhOaXrkO6BuGDBw1hZBm+
 6OFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0sCHWHz2FQArWO8NWOc+SMDIT9sNo9CQt7F1jNlLsEo=;
 b=1/yNJQauaBJqXcjf6O9b56pmyLv19NTi8tmL53WmcsTDLimmGqT1BcScvJ7j5li6hk
 o+Z2Ic56dkgcu4XTVVNV7OoZ6Ye1xf24iOkd0x6u39lXgqgDJtsiLDmsHx7dXPs94D9M
 w/m/CvBn+afHb6t6wNNQI6R56lawosw6ltkedjSyYl0qeKlpuBylkhzUKdSDjc0a66G9
 zEAcmlYYWWAgsx0uw8heBJn18iR2tb3dg0RYmnBZVPqun1CwQUytsQWWid3xdNNMt/Mo
 r+X0Ux5cYiAcRbJkjKWUNCNG0j20dARg3EnDC4V/mfPEhexWZVswZbrD0dXhrmX0VmG1
 gebg==
X-Gm-Message-State: AOAM5324g98pzlKe+ljnAvTROhVhx1u2rLe3b7HXPr9IVZ09hOaqzVCb
 laIW9maQ+/qm/J8HcqtI4bs=
X-Google-Smtp-Source: ABdhPJyel2/33gja30sx0i9spANbNe8ZhexnQ3NVfJVFBPiEkO6hQgyzqJrVEHqQfl/c4hvTYxB6sg==
X-Received: by 2002:a17:90a:c401:: with SMTP id
 i1mr11908892pjt.180.1641498703271; 
 Thu, 06 Jan 2022 11:51:43 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id y10sm4494037pjy.24.2022.01.06.11.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 11:51:42 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <0dc1ae13-f7a8-b042-c724-7d72d0477da7@amsat.org>
Date: Thu, 6 Jan 2022 20:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] target/riscv: Fix position of 'experimental' comment
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Vineet Gupta <vineetg@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-trivial@nongnu.org
References: <20220106134020.1628889-1-philipp.tomsich@vrull.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220106134020.1628889-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 06 Jan 2022 19:51:47 -0000

Cc'ing qemu-trivial@

On 6/1/22 14:40, Philipp Tomsich wrote:
> When commit 0643c12e4b dropped the 'x-' prefix for Zb[abcs] and set
> them to be enabled by default, the comment about experimental
> extensions was kept in place above them.  This moves it down a few
> lines to only cover experimental extensions.
> 
> References: 0643c12e4b ("target/riscv: Enable bitmanip Zb[abcs] instructions")
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> ---
> 
>   target/riscv/cpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6ef3314bce..e322e729d2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -640,11 +640,12 @@ static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>   
> -    /* These are experimental so mark with 'x-' */
>       DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>       DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>       DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>       DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> +
> +    /* These are experimental so mark with 'x-' */
>       DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>       /* ePMP 0.9.3 */



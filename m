Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIB0P-0003fT-Bc
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 11:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIB0N-0003cC-3u
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 11:09:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIB0L-0002K9-Ls
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 11:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674058177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EnczWuya39j3dK9APW5iguAlxAq+7FeVUnZHxoSSFc=;
 b=gYMyBe10GykfsEo/1jGvrWsnWHxqmAd8CceDUm8KTcom3/JPBkCNSG1sR3IlPNySj621EH
 oNZarLRvf3jZoMdXTr6+3mKK0SmE+nuaoZBs5LjzXA/OjlGvsxe+DNmwuwVe5gOw0kij6+
 OMMLyZjKqsI2dM9Rv1tM2PUMrJWksho=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-ShFCUJmgNRyCbIGCIqv6EQ-1; Wed, 18 Jan 2023 11:09:36 -0500
X-MC-Unique: ShFCUJmgNRyCbIGCIqv6EQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 i17-20020a25bc11000000b007b59a5b74aaso37340233ybh.7
 for <qemu-riscv@nongnu.org>; Wed, 18 Jan 2023 08:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2EnczWuya39j3dK9APW5iguAlxAq+7FeVUnZHxoSSFc=;
 b=lFVcuNA3aU3QSq6ui3xlb+Mk6BwNI7P50ACZTzWwzEcMhomhElAZ0PgpTeOjajsaWG
 0AbBInsRh8peo9WTtyqsvNmCj38BBAMaRhV1Rwjj4HusuP+yyteGDFsELQ8T1Jw64zCY
 giSFYJaPxda//Si8cgALJy0FPdjQiI1asAumXqm8Cmg3qJdFo7aVHbyC4c4W7W2DQwJ0
 /wxUj0FeGvM3NmT2pEZEtNjt21HqCoUbyIqEnsxS8YyhcIi/lxjv8PoE7ul6wH0Vnr64
 UN58PvqMnV0y5sqd3llMZzdmA82KJIRKo4NcB+dZFqnWeUx8MlPeJVcMddjVPlLW+KfP
 Dm6g==
X-Gm-Message-State: AFqh2kroppB60kfC0sWM7OaE6QltR0GfWwesVSCWpGZ8AWHIWeYuVOTR
 lOgO78TUB4nfGmhRLpMP+gHQbrbQ1w4oL7ZF75GhuNR7yXnvmv0+xfRt9343gyFex3pboBmRc6/
 EQlffjQiwPaX4XFI=
X-Received: by 2002:a05:7500:6609:b0:f0:4854:5db7 with SMTP id
 ix9-20020a057500660900b000f048545db7mr641460gab.68.1674058175563; 
 Wed, 18 Jan 2023 08:09:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuVP5/SWeJB2lutyvhgQ2YZhLMohEzlUfcpuOUC+rFr3W9UVhIpf50cM6hJmUPfmi6tKoMvMg==
X-Received: by 2002:a05:7500:6609:b0:f0:4854:5db7 with SMTP id
 ix9-20020a057500660900b000f048545db7mr641419gab.68.1674058175188; 
 Wed, 18 Jan 2023 08:09:35 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-5.customers.d1-online.com.
 [80.187.99.5]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05620a28ce00b007062139ecb3sm10885240qkp.95.2023.01.18.08.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 08:09:34 -0800 (PST)
Message-ID: <fd06e139-c6e8-e978-c0ed-3e9aca258f19@redhat.com>
Date: Wed, 18 Jan 2023 17:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] bulk: Coding style fixes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20230111083909.42624-1-philmd@linaro.org>
 <20230111083909.42624-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230111083909.42624-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 18 Jan 2023 16:09:39 -0000

On 11/01/2023 09.39, Philippe Mathieu-Daudé wrote:
> Fix the following checkpatch.pl violation on lines using the
> TARGET_FMT_plx definition to avoid:
> 
>    WARNING: line over 80 characters

It's just a warning...

> @@ -420,8 +421,9 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
>                   hwaddr curaddr;
>                   uint32_t a0, a1, a2, a3;
>   
> -                qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FMT_plx
> -                         "\n", ppc_hash32_hpt_base(cpu),
> +                qemu_log("Page table: " TARGET_FMT_plx
> +                         " len " TARGET_FMT_plx "\n",
> +                         ppc_hash32_hpt_base(cpu),
>                            ppc_hash32_hpt_mask(cpu) + 0x80);
>                   for (curaddr = ppc_hash32_hpt_base(cpu);
>                        curaddr < (ppc_hash32_hpt_base(cpu)

... and in cases like this, I'd really prefer the original line.

I think it would be better to just fix it if checkpatch.pl really throws an 
ERROR instead of a WARNING.

  Thomas



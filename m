Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oP3dY-0004D1-2F
	for mharc-qemu-riscv@gnu.org; Fri, 19 Aug 2022 11:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP3dT-000496-SH
 for qemu-riscv@nongnu.org; Fri, 19 Aug 2022 11:10:11 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP3dR-0001Pm-Ts
 for qemu-riscv@nongnu.org; Fri, 19 Aug 2022 11:10:11 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d10so4381040plr.6
 for <qemu-riscv@nongnu.org>; Fri, 19 Aug 2022 08:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=FYm5k9h2xs2IWKY6g3jSJnodEna7VliHX/getQOREew=;
 b=PLTrlEmQKLXEA+0wrXYufy+RF+rMWnwI4h9w6hH+eX8pPeMKPD/vikauJFTaIcT04t
 KDo4Qkc1nwqgY4svVKeuxWSkTWYRCbAPet9BfPtynl+DSo4cuvSVPXhVPALjASFX0aZQ
 Fi8AfLbIyC2Zz6rRQ9Ya1VsTfsvQ96ZbpyzF4baXifDKjbbs7KcGAVmSzQ4MTAbzQ2ql
 uYxNmxMRQkQZnRkb2BpJg1t92bTlz02tVqob316/ngAEvU82Nqm45vv+WhFtVQZ1luhJ
 B+YkX1kK98wLyl9NFTJOEjwxom1NnerdXPeM7Gnvm7fC1YPIp3n+UDwmkpZoQNG7pEmm
 vvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FYm5k9h2xs2IWKY6g3jSJnodEna7VliHX/getQOREew=;
 b=umrrG9RQqzOeYNcKwggw276dRmC8kNMe790Iv3vPR+cim+P9EmvN+98FZ86zShRkM/
 li16lKDWdFpIJ7U0kqRi5X+J7kFAUXic2tQITNEJmPVA8ihAX7fj5iM7v+djWG7lwNj6
 a3D/n1RgpzSQxVvvQ7sHy2rdkC091uS7k4EU0blbXqugkoAKUWj8pZSuW4nsyNqL37v0
 iBHBGAksZeRZsrmASakLceuAEg1binzmfGUBAVPweYBeRwWVUzcWxmUZDBphqgx8RXqG
 iJtkfZnLRzB1QyaSTeFQINlTDzoXPJQ11cXigN6LNjGYuzGXAKZzIMs7WjTlxwXRJUZr
 9xxw==
X-Gm-Message-State: ACgBeo1irgeCWLVwFscKirmXvGJNSLENkRIcSnZU2sV1lB4xRGdp+XxY
 L3VaMBosooB6/icOCmeYECfEjg==
X-Google-Smtp-Source: AA6agR5JUqvGzy1gp1PahCkey+xmBc1a9CPF+QeS6LsAy26eB3Zj7Op98rxfc3dLD4f/dpgkFK/TuA==
X-Received: by 2002:a17:902:8486:b0:171:48cd:1356 with SMTP id
 c6-20020a170902848600b0017148cd1356mr7434586plo.153.1660921808474; 
 Fri, 19 Aug 2022 08:10:08 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb?
 ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a17090a31cf00b001f2e6388fe6sm5455678pjf.6.2022.08.19.08.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 08:10:07 -0700 (PDT)
Message-ID: <787bcb91-c20c-3b33-b052-95453cf6827c@linaro.org>
Date: Fri, 19 Aug 2022 08:10:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] target/riscv: Use official extension names for AIA CSRs
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20220819073147.174790-1-apatel@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819073147.174790-1-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 19 Aug 2022 15:10:12 -0000

On 8/19/22 00:31, Anup Patel wrote:
>   static int aia_hmode(CPURISCVState *env, int csrno)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);

Better as

     RISCVCPU *cpu = env_archcpu(env);


r~


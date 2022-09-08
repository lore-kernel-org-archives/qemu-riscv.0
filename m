Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWCF6-0001f7-VD
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 03:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWCF5-0001d4-PP
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 03:46:31 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWCF4-0003Q6-3g
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 03:46:31 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso1118170wmr.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Sep 2022 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=DhLqb6+PC2DsBAOxuSMWxkJpnOzD4mDj8ZSprdoU6k4=;
 b=EWWsDNK908ohYPw9AdIkIK5Zjcl7SOE0aNGKZBUuPKZoMFFUA7gEeEmRsW4UWWo4sd
 FO1x2Twqq3dYH6p50uu87rYusuZWSduyUqGMe+GnD9SYctlU8D5ENNZ8xb0uHrvA1boP
 PA77MiFEoN26Nap9Rlknloe+bjxgA+1FA0Owg4kQrjuXGItg1aEN1kD1Q8Z7hVCO3lp4
 Bhsxk46Cgkly8pP9YzU3P8GOMTqDQiHYzXK7MTp5wMQgJm0OwlzWOVC7HDKHColQrCL4
 lAdTCdd0NCk6X6z0EbRlY4ZPtWaFSIDVdAuSnozSUYFdlLEnNMNO4O1HvfGVsB5RIvFh
 DFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=DhLqb6+PC2DsBAOxuSMWxkJpnOzD4mDj8ZSprdoU6k4=;
 b=DC7xa6AfmHy2AynRNYA28h5Tj/naOkFXdU/YpNpVeLwn2QyZ7bmjqQQzOCG3C3QSVn
 EuRHScq5KPNDlOre+Z9QOtKLc7Mmfr0GxUH6PK90tI9XUZBj6IBgCm/MDF7YFRG6d0rX
 W0hUw0J248mzemiThBthyGEIlDt7ChxSzFDOWZ8syAHx6Rdd3pRzmANsoT/m0esvD2Ta
 1z4BuB4l0QkvRA/5hRoVVSJKhEWtMdGPcCw7/PbCIb0T5Z/lv/or+fvAV9PZ6bUljCEw
 IIT1CYEkiPlXxsoT9/fm7x+NMn8RzHknCk7Cg359B0m/cglLnfcrSlqCMa5taJPHkXrr
 Uzmg==
X-Gm-Message-State: ACgBeo1zB/b88apd3unrr4h6jZ/kgVlmM/wIhBkOKFM7O67BfrXb5R7t
 2s/8+ezPEfwGS1/E8ALieeWZGg==
X-Google-Smtp-Source: AA6agR5KVd7tj4Z8HSqYyAAcE3Uvm68CWuwERbUEahjlm82AvFg2gAtl8ulahTg0tiY/eXatH1eWOQ==
X-Received: by 2002:a05:600c:4f43:b0:3a6:2335:f5de with SMTP id
 m3-20020a05600c4f4300b003a62335f5demr1315436wmq.109.1662623188519; 
 Thu, 08 Sep 2022 00:46:28 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d528b000000b0021e42e7c7dbsm18798489wrv.83.2022.09.08.00.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 00:46:28 -0700 (PDT)
Message-ID: <9eba2b9e-ebe0-bf2d-2dc7-75ae81b0592e@linaro.org>
Date: Thu, 8 Sep 2022 08:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 11/11] RISC-V: Add initial support for T-Head C906 and
 C910 CPUs
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-12-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220906122243.1243354-12-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
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
X-List-Received-Date: Thu, 08 Sep 2022 07:46:32 -0000

On 9/6/22 13:22, Christoph Muellner wrote:
> +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C910,       rv64_thead_c906_cpu_init),

Why model both if they're identical?


r~


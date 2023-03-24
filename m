Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pflev-00034M-2y
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 13:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pflet-0002vo-7I
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:56:59 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfleq-0003w5-KQ
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:56:57 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso1781233pjz.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Mar 2023 10:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679680615;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6vU06MqQzb+fjK4azo5ZRLu4sk7GNEojydl4xbrQQCM=;
 b=wo16BBmycAFHF6RAnP5c/DMRDof3+3uN0qR6EhDeWrmbgAnjlvOzHXp07alQVibh+7
 uEPwAKuozjkiMeWT7i64DpO8GTPnMWbZHY21WEwSlRtnBzs3WxlCm3uVUvsSMSL7dyFx
 pFUPOUiG37LE3REtdJJI+cPFs4RVsmXOYgtv8Zf7bozvpnGBAN0MKOoC8adwbx1p7GKD
 xpP2PYn5EyrgZum8A1JuuIZhdGOPlsw79ENXiX9t/8B7hwdtC/hbQaXTwll7CWXG/67a
 xDCivgwJLDV79wsQRdGDj6EUW7odnV5midC/GFf4XhS8Teg50e3aHq00N7pHIOigDUlM
 u/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679680615;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6vU06MqQzb+fjK4azo5ZRLu4sk7GNEojydl4xbrQQCM=;
 b=dmWbY5sR4+MpoT8+IdDkaEEvNozrkjsYK0kULp5Oqw8YXLBQ2DodHWJU4b4/THC9J/
 zYY2vG8EUDTDUAbR5Nthb+bwaXUUPkNdlKzlkXBz+5HCEoO9I6n8bj9sbjNSv+nN3o5x
 R7yVljc4cXcSQQzUsFK3f4R+zlQIvwfbLgHjEPGT9L0pBcEf+mSM9qjxhJVoFlPu5Oal
 lmSqDmy/6/U36O/mFDyeT5e15DLqxchSZDumEW2si7TWzN0+jd8lYmn2wwNbBtfr6EEu
 7fMMLZnWuO+YVOpiZuxxjKBexk70P2TBIHfaEI1bOOmDSgLaSllcu6g7MomiXRrrzwWh
 6yDg==
X-Gm-Message-State: AAQBX9dB23USOm6F2SoCpuLoO2wPBuagTp5gnMQ0oPH7QHPqYNkaB6ek
 NmOM+ELRS4RC/VYT0/Tquiq+2g==
X-Google-Smtp-Source: AKy350YBjID9cY6yK3TRKFVVNRIXGKguWPbyP/568Sp2AOfxTY5uCllTCuT4t7Y8zyE3g0SWr8A0EA==
X-Received: by 2002:a17:902:e84e:b0:1a1:8860:70e5 with SMTP id
 t14-20020a170902e84e00b001a1886070e5mr4151400plg.57.1679680614920; 
 Fri, 24 Mar 2023 10:56:54 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 jd1-20020a170903260100b0019b0afc24e8sm14481233plb.250.2023.03.24.10.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:56:54 -0700 (PDT)
Message-ID: <f3eaf145-800c-a1a0-a08b-a8cb849fa2e4@linaro.org>
Date: Fri, 24 Mar 2023 10:56:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/2] target/riscv: separate priv from mmu_idx
Content-Language: en-US
To: Fei Wu <fei2.wu@intel.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 zhiwei_liu@linux.alibaba.com, liweiwei@iscas.ac.cn
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20230324054154.414846-1-fei2.wu@intel.com>
 <20230324054154.414846-2-fei2.wu@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324054154.414846-2-fei2.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 17:56:59 -0000

On 3/23/23 22:41, Fei Wu wrote:
> @@ -762,7 +764,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>        * (riscv_cpu_do_interrupt) is correct */
>       MemTxResult res;
>       MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> -    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
> +    int mode = env->priv;

This is not ok.

Or rather, it's ok as an intermediate step before fixing the other mis-uses of the 
interface in get_physical_address.

The interface to be provided by TCGCPUOps.tlb_fill is that (modulo tlb flushes) mmu_idx 
details the state we want the access to have.  We describe that state with the comment you 
move in patch 2:

+/*
+ * The current MMU Modes are:
+ *  - U                 0b000
+ *  - S                 0b001
+ *  - S+SUM             0b010
+ *  - M                 0b011
+ *  - HLV/HLVX/HSV adds 0b100
+ */

Anything that's in those bits shouldn't be re-examined from env.

So, in the short-term I'll give you

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

But for the long-term, let's see if we can untangle the ugly mess. I'll collect my 
thoughts and post some patches for discussion -- I think that will be clearer than the 
prose I began to write here.


r~


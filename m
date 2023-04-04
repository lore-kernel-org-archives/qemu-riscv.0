Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjhI1-00072W-M6
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 10:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjhI0-0006u8-2p
 for qemu-riscv@nongnu.org; Tue, 04 Apr 2023 10:05:36 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjhHx-0007Ww-Dr
 for qemu-riscv@nongnu.org; Tue, 04 Apr 2023 10:05:35 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso36273606pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 04 Apr 2023 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680617132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UxVVIkUTAJ6sSMedjGQCm8dBUPzmw2wlVRsl/A4BgBM=;
 b=guxF5lByMPcgtr/OCIf98BqdSsdakZQyiszcS/sV31neCbCoLZmszR8RUHcdBwXWzo
 Iu0zbdfmyWjr9yEL9SRTXaNFQRY1j2ZLoBdf0m+8ZVuNYlafLQT+nCCVwP56nPLcCJld
 ToRvrW1jK3H5+QThOVaNXFPasPGUYuuDpWYvVOZyV6NIicJRMkdunZI2baH/gPuHhxPt
 ZDyCtAZ2r93Gku2TWbCbjgkJmW5rtS5Wdv6DH6rhV4iCjdwr+dsDVx9NBfENKNkuQTCl
 aQ8O4lP/AtV7A96SL4laiv0ziAtDq4Joft+l6LZCfNL20uTqEjeUoo6iMgRB18C+nxyO
 nYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680617132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UxVVIkUTAJ6sSMedjGQCm8dBUPzmw2wlVRsl/A4BgBM=;
 b=m7H3vVt7Ugm0T0+Sd3XP2awjUcUY9qa2qme0SWEolgzAZrghL89y+8C9r6IiRr5341
 TYA3taXBi+D7S9LhwPIlK9UO/FJSKhkXqx3yHL0yI0aRHi91DdNAPfhLeVM+PfcPm0JA
 TdHpkRBekf4K8dFGpUmsJKFKm+yk7cYEnO5AsZn8VmCXpcTL5LV0GVYaYtrscH51r+sn
 XfKp7gI/TqwM9qQWewHCrOOr3r4Oc6hQq7o83P2I+ZVSw8Yu3vw+/9Y4007GY9Tr2JOq
 jDnvhlPzrANpnCRScWWVEOOo9xqNnzGduq0RMK81gcs+TcNdUsz55UsKT1nq0mLO8cd1
 a8Gg==
X-Gm-Message-State: AAQBX9eHWlKvunTwUkjA7dtrx0IDbnMGo7vtyvwfgAXE4tEWXjIcKZRx
 W8zI0wAXF3wmZ1COvkzOemWAaA==
X-Google-Smtp-Source: AKy350bBTNKUX8FPl/H078vDvx9wTW05nWKS5hPkvWlFhuxXFtmRwqgum45NR0/d8muivLTOxtRPDw==
X-Received: by 2002:a17:902:c94e:b0:1a0:65d3:bae4 with SMTP id
 i14-20020a170902c94e00b001a065d3bae4mr3426419pla.38.1680617131604; 
 Tue, 04 Apr 2023 07:05:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a17090ae50200b0023b4d33bedbsm7977127pjy.21.2023.04.04.07.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:05:31 -0700 (PDT)
Message-ID: <1a03c6de-9da3-c5ed-f59c-a90c5a07e97b@linaro.org>
Date: Tue, 4 Apr 2023 07:05:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 4/6] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, liweiwei
 <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-5-liweiwei@iscas.ac.cn>
 <3bd89c54-3a20-1031-1502-a8744c2caa36@linux.alibaba.com>
 <943a4563-2f63-1885-47d6-ec2a23552672@iscas.ac.cn>
 <5c23fb0d-76d1-572c-a53a-d7e0d0e56643@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5c23fb0d-76d1-572c-a53a-d7e0d0e56643@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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
X-List-Received-Date: Tue, 04 Apr 2023 14:05:36 -0000

On 4/4/23 00:07, LIU Zhiwei wrote:
> Yes, I think so. I just suspect whether it is easy to read and verify the correctness. And 
> the maintenance for the future.
> 
> 
> 1) Maybe we should split the PCREL to a split patch set, as it is a new feature. The point 
> masking can still use this thread.

Yes.

> 2) For the new patch set for PCREL, process where we need to modify one by one. One clue 
> for recognize where to modify is the ctx pc related fields, such as 
> pc_next/pc_first/succ_insn_pc.
> 
> One thing may worth to try is that don't change the code in insn_trans/trans_X.  Just 
> rename the origin API we need to modify to a new name with _abs suffix. And and a 
> correspond set of API for PCREL with _pcrel suffix.
> 
> For example, in DisasContext, we define
> 
> void (*gen_set_gpri)(DisasContext *ctx, int reg_num, target_long imm);
> 
> In disas_init_fn,
> 
> if (tb_cflags(tb) & CF_PCREL) {
>      gen_set_gpri = gen_set_gpri_pcrel;
> } else {
>      gen_set_gpri = gen_set_gpri_abs;
> }
> 
> Thus we can write the code in trans_insn without think about the PCREL.

No.  Please have a look at how the other conversions have progressed.  E.g.

https://lore.kernel.org/qemu-devel/20220930220312.135327-1-richard.henderson@linaro.org/

Step by step, each of the internal translation functions is converted from absolute to 
relative values.  By operating on relative values, all knowledge of "pc" is centralized, 
and it simplifies the trans_* functions.


r~


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSPKC-0004yh-4q
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 16:28:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSPKA-0004xn-Gc
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 16:28:22 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSPK8-00089C-NN
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 16:28:22 -0500
Received: by mail-pj1-x1032.google.com with SMTP id d2so19522773pjd.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 13:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j0q0/pTqriQ9Hb7kAiuEcH4bE/OFSp4bYBgJiY4kGr0=;
 b=Jnw1QhY93HBmDGFKDIrmdjMEuLOKP3nfPDBLgK+H0VvPUYxdl3nimU6TwpTF6vXrVk
 uTtB21j0QMVqTu4zvIwhWWMcSYaRgb6ImWjRPye+CfTAeIpZ7Q96fPLJxctXSmf5OUPm
 BrHZAW4NivGH9k2rZ49sJ7V5wfGEGomAu0WSv8gnEzQrIC9vJH5Z1y8ssPGgGLDABLDP
 H4wbHW9xbFCfF0lk8zz4jEobiuHeppy8ukgj64NZJ4h2mpWH2x1LiDO9Zw3Pi3TxxjNn
 gTRSwYX+IgHzTiGvo8CimU2Mccu1sOoMFGr4VoxaMmA9j4iUzZ8tVXpOm8eNC0v2Tw9/
 ly9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j0q0/pTqriQ9Hb7kAiuEcH4bE/OFSp4bYBgJiY4kGr0=;
 b=H3Ac6o9HoxNdloZnTAFlfk5PbHN5OhgF36fk7cVP3296gh3GNQzD2oDH88gLPNuE8M
 K3YnCFm3rT6yLflT6K7Ol3NjDMQdYfFNoaaOS7SEZBMXtl2TQrLwl7cBquFmCVDTOOf2
 o+13Q++Ma5yBtkPEwEE7ymn2h2MNORmdLd8fq6pl3qi0Qae2uREUCMfZzQcInyy1HTWA
 J9xNkdWBccDOaUzQgE1+SlBCirqjQzRv9gk0ru8zC6/c7KEBs1iiQ2iAxaDo03v1obih
 QUDQcXNFjDgX299N37rKHlJsI/+nXElp7KhLmey1Qmm2bHYtVvUuJx80x9NdaiUJLgto
 m3ow==
X-Gm-Message-State: AO0yUKVmSZjuto+NimxuPC8BP7bocKDPfOd/+tBttldX5T3KrAvgBkTq
 KvMoeAsHN05pBpt8XorDiVn0Gw==
X-Google-Smtp-Source: AK7set+WI701AYfpGWuRzomHWOanwn9drbA2ev0oftEHnprjYVkixdKuxnWfmu2GnUuF9j4sIcKmfQ==
X-Received: by 2002:a17:90b:4a4d:b0:234:cda:1b8b with SMTP id
 lb13-20020a17090b4a4d00b002340cda1b8bmr4287454pjb.30.1676496498911; 
 Wed, 15 Feb 2023 13:28:18 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 k11-20020a17090aef0b00b0021904307a53sm1940320pjz.19.2023.02.15.13.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 13:28:18 -0800 (PST)
Message-ID: <baa325da-c718-d9a4-d0d7-6b9c66b7f47b@linaro.org>
Date: Wed, 15 Feb 2023 11:28:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 2/4] target/riscv: implement Zicboz extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230215205911.695745-1-dbarboza@ventanamicro.com>
 <20230215205911.695745-3-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215205911.695745-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
X-List-Received-Date: Wed, 15 Feb 2023 21:28:22 -0000

On 2/15/23 10:59, Daniel Henrique Barboza wrote:
> +    mem = probe_access(env, address, cbozlen, MMU_DATA_STORE,
> +                       cpu_mmu_index(env, false), ra);
> +
> +    /* Zero the block */
> +    memset(mem, 0, cbozlen);

Will crash if address does not resolve to ram.

According to page 16, you need to store zeros even if the memory is not cacheable.  C.f. 
target/arm/helper-a64.c HELPER(dc_zva) or target/s390x/tcg/mem_helper.c do_access_memset.

While re-reading the ARM code, I remembered that the ARM dc.zva instruction is required to 
produce original unmasked address on a page fault, thus the little dance with two calls to 
probe_write.

I don't immediately see language in the risc-v spec beyond "CMO instructions do not 
generate address misaligned exceptions."


r~


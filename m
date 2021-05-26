Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llxYV-0008V3-WD
	for mharc-qemu-riscv@gnu.org; Wed, 26 May 2021 13:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llxYT-0008Nk-Sj
 for qemu-riscv@nongnu.org; Wed, 26 May 2021 13:42:53 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llxYR-0006DF-Uk
 for qemu-riscv@nongnu.org; Wed, 26 May 2021 13:42:53 -0400
Received: by mail-pl1-x631.google.com with SMTP id u7so989165plq.4
 for <qemu-riscv@nongnu.org>; Wed, 26 May 2021 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ebV2L6YkJ3ftQHodKPGw/tTpwzJUCoKeijb7QGEw1X4=;
 b=bTLepR2J+2jsdeL+PTkBUG1IlYyTe2vySCyq00AAM+7e8n2RsimMevdNGTZVKbbPhi
 tbQNty7wD+dCwx9dWslCrf8rrdeiJG70HQ2PObRXMXDajtfP1YoMaynmiX0WcJjv/uDa
 gtW3OFjjqqke8Lc/lvPTAsvvvOj4EbJNqs+BTKYTnWI4dlN4zziuN+FgfBVyib/VN11G
 Zurz2wJLLfWdbuvTUSLELW9E/H7Sl995sK5zLcBJFzfxfPq2oaDYBxKIMdlBulIZG8jg
 Bj+cRuTXYV7ye5z3LN8JYdoNjZNIUyaRrhEBwwmCnKiCe396ooLVdOt466y7tRaC1qt5
 lnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ebV2L6YkJ3ftQHodKPGw/tTpwzJUCoKeijb7QGEw1X4=;
 b=jk7R0wJ5+SegLIqEDzWJPbmsZe3K3PNPmO2R7Yd64y6LBOOlYO2xW+e8KaggGr6XAH
 CoETxebIOMinqYSpO7xYfL/c+ovssLdlkj/LsOagEGf2n1UIONeY2o9spCBx/Ub3NFZI
 HVZZA2TxaZ2bCdqbPdw5qJplrxhFK0Br05D6ZOXTlKiiN9/K4Xl0prWrXtr6tf4f8WEm
 J4xivNvWcIAnT8xY8ekuk5GMsf0WZT9Gtx7uIoKvaBby1uregK8EBSWYV1s9wLxthFiR
 q7rhQmvGATVKlkKwxFna1rMSxo4qdC5w1OwUpy2L9gBtKR7KMy93iobJlP0wK8Qi4Qq1
 XnJw==
X-Gm-Message-State: AOAM53195UeGj9MAAs3p1rmhnqTHEbkyYabAKIygW7iWFX8e1zq5AZSp
 /A1Rfq6TQbzGvHSo21SJWu/vaQ==
X-Google-Smtp-Source: ABdhPJyqR6k9XMHcLjQH73HkPxJ/wnapsrknRJQ+gbuWnvhhA99ChVMwp2/bALYqsKC4Ia4sg4k51Q==
X-Received: by 2002:a17:90a:880c:: with SMTP id
 s12mr37600933pjn.66.1622050970143; 
 Wed, 26 May 2021 10:42:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u19sm16245675pfn.158.2021.05.26.10.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 10:42:49 -0700 (PDT)
Subject: Re: [PATCH v7 00/23] cpu: Introduce SysemuCPUOps structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e0baa8d-b123-5e61-7bb3-c642ab25564a@linaro.org>
Date: Wed, 26 May 2021 10:42:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 26 May 2021 17:42:54 -0000

On 5/17/21 3:51 AM, Philippe Mathieu-Daudé wrote:
>    cpu: Remove duplicated 'sysemu/hw_accel.h' header
>    cpu: Split as cpu-common / cpu-sysemu
>    cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs
>    cpu: Introduce cpu_virtio_is_big_endian()
>    cpu: Directly use cpu_write_elf*() fallback handlers in place
>    cpu: Directly use get_paging_enabled() fallback handlers in place
>    cpu: Directly use get_memory_mapping() fallback handlers in place
>    cpu: Assert DeviceClass::vmsd is NULL on user emulation
>    cpu: Rename CPUClass vmsd -> legacy_vmsd
>    cpu: Move AVR target vmsd field from CPUClass to DeviceClass
>    cpu: Introduce SysemuCPUOps structure
>    cpu: Move CPUClass::vmsd to SysemuCPUOps
>    cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps
>    cpu: Move CPUClass::get_crash_info to SysemuCPUOps
>    cpu: Move CPUClass::write_elf* to SysemuCPUOps
>    cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps
>    cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps
>    cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps
>    cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps

I've queued all of these to tcg-next, fixing minor patch conflicts on the way. 
  Most of which were the reorg going on in target/ppc/.

>    cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.c

I squashed this one back into "Introduce SysemuCPUOps structure", and moved the 
target/*/ includes from cpu.h next to where the structure is declared.


r~


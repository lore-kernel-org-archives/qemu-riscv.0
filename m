Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFL73-0006YK-RY
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 15:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFL71-0006WF-Lx
 for qemu-riscv@nongnu.org; Tue, 10 Jan 2023 15:20:47 -0500
Received: from mail-oa1-x44.google.com ([2001:4860:4864:20::44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFL6z-0002IQ-R2
 for qemu-riscv@nongnu.org; Tue, 10 Jan 2023 15:20:47 -0500
Received: by mail-oa1-x44.google.com with SMTP id
 586e51a60fabf-1442977d77dso13353442fac.6
 for <qemu-riscv@nongnu.org>; Tue, 10 Jan 2023 12:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WQ1pG8zYSnx3v/Ry1ROAZDp+bSzGiAD5ZqaaBrQYfNE=;
 b=NUVDkOpGdWocIWbwrAoPb3ZU57UMDj9SNpQp4mydTtIU2jcHLqbI1zaBcaHzSu/PXT
 xCF4E47xKXhzPPzv4r1i4o56p30eUOYIWLov0t8NTv7Lf6XTLZMwT4nyev6hm15enrM5
 5EnsnhMvfXJYybloDKTxN6i1Nx2jBPyR/JRT7Nv4qTH/D8zfqehwa5Wts3zPg75sKfyi
 QAxY+i5xdc8I/uD3T9hwKv2iN7har3fvjT4es8C7oqBGtja9uv0jWUhIvrw+LSrAipwl
 aT8h/vRXTr8tUMRZHYZTO4uHozuwDnLR85+jw6+U5Qv4rg1t3x0kejVi1U05iTeDLd30
 QSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WQ1pG8zYSnx3v/Ry1ROAZDp+bSzGiAD5ZqaaBrQYfNE=;
 b=Yl/Oq0PbGxsT8g2BDSyeRczXSh4cPQNMD7cen/y2/NkBVYofi7NSLFHNcD0tror9rD
 xGZp1QvJv9JPAD0Lfjk3gXDLRVnPmkfXJYeIpYQzR2+eaeHuBnUvEtj7sw+ilhTrUAFA
 bfJeIGj6QmOgz8R5c9F63Qd48sZwH+Nz0ehUMr0w7tQ/nTW6PEVSTd9e8MmnKDMvab0v
 8JBsPAPMtNFl4jbuGfLRvRJHUas9XQ2iWLUsa+HLiOeTv06dwUC0iSv2L+Laf20tLosF
 epzRpTQWG1RfgRQtsTyyIOHjiRwWYO4vrPCPt9L4aK3cMzZ5NKsC8xRzmIaT/o1CS1KD
 p9pQ==
X-Gm-Message-State: AFqh2krp4xi2S3kQmrchvdr7pAySJBPio4B7yeKVkSkcqhrIDzjipiS1
 RIbGDcSDgDtlEGG/ZPbzAH33PQ==
X-Google-Smtp-Source: AMrXdXsrU0alnVJ85GRnUhUOJE76e7H3dmmdj2U5hgl0aAT1ZRqxfINu7UhUHIUhewwOFs2rWEs1SQ==
X-Received: by 2002:a05:6870:9d8f:b0:152:1174:3032 with SMTP id
 pv15-20020a0568709d8f00b0015211743032mr10541953oab.35.1673382044506; 
 Tue, 10 Jan 2023 12:20:44 -0800 (PST)
Received: from [192.168.68.107] ([152.250.93.24])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a4ad899000000b004cb9100ec7esm3520660oov.18.2023.01.10.12.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 12:20:44 -0800 (PST)
Message-ID: <842056c4-4f77-0db7-fa89-e3973b81bd23@ventanamicro.com>
Date: Tue, 10 Jan 2023 17:20:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
 <CAEUhbmUfWbssTO1w8q_VdrWDHE4JLdJvZGkkt_w+KChsR5P32g@mail.gmail.com>
 <1adba771-6632-4f68-d72f-4389f9ce7012@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <1adba771-6632-4f68-d72f-4389f9ce7012@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::44;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x44.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 20:20:47 -0000



On 1/10/23 08:43, Daniel Henrique Barboza wrote:
>
>
> On 1/8/23 00:33, Bin Meng wrote:
>> On Mon, Jan 2, 2023 at 7:55 PM Daniel Henrique Barboza
>> <dbarboza@ventanamicro.com> wrote:
>>> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
>>> the same steps when '-kernel' is used:
>>>
>>> - execute load_kernel()
>>> - load init_rd()
>>> - write kernel_cmdline
>>>
>>> Let's fold everything inside riscv_load_kernel() to avoid code
>>> repetition. To not change the behavior of boards that aren't calling
>>> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
>> typo: should be riscv_load_initrd()
>>
>>> allow these boards to opt out from initrd loading.
>>>
>>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   hw/riscv/boot.c            | 22 +++++++++++++++++++---
>>>   hw/riscv/microchip_pfsoc.c | 12 ++----------
>>>   hw/riscv/opentitan.c       |  2 +-
>>>   hw/riscv/sifive_e.c        |  3 ++-
>>>   hw/riscv/sifive_u.c        | 12 ++----------
>>>   hw/riscv/spike.c           | 11 +----------
>>>   hw/riscv/virt.c            | 12 ++----------
>>>   include/hw/riscv/boot.h    |  1 +
>>>   8 files changed, 30 insertions(+), 45 deletions(-)
>>>
>> Otherwise,
>> Reviewed-by: Bin Meng <bmeng@tinylab.org>
>
> Thanks!
>
> Alistair, let me know if you want me to send another version with the commit
> message typo fixed. I might as well take the change to rebase it with
> riscv-to-apply.next.

While rebasing these patches on top of riscv-to-apply.next, the avocado tests
I've introduced here started to fail both sifive_u tests:

tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_sifive_u: INTERRUPTED:
Test interrupted by SIGTERM\nRunner error occurred: ... (5.07 s)
  (09/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv64_sifive_u: INTERRUPTED:
Test interrupted by SIGTERM\nRunner error occurred: ... (5.05 s)


I proposed a fix here:

https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02035.html

I can re-send this series after we get that problem figure out. Otherwise we're
going to add 2 avocado tests that are failing right from the start hehe.

Thanks,

Daniel


>
>
> Daniel
>



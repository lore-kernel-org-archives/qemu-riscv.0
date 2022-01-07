Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5qMM-0005ch-Ry
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 09:36:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qMK-0005Y1-KD; Fri, 07 Jan 2022 09:36:48 -0500
Received: from [2a00:1450:4864:20::431] (port=43633
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qMJ-0008WP-5c; Fri, 07 Jan 2022 09:36:48 -0500
Received: by mail-wr1-x431.google.com with SMTP id o3so11394029wrh.10;
 Fri, 07 Jan 2022 06:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+3Nc6zEdR43z3razwv1XE8PU4kQ0+jJ55RCBwOavKuA=;
 b=jApoJ9XGqXm3hOEhdShp1rGvr94Yt6XizpCBLgn8FCzTw66TsZOoYtVySLcKLOtafL
 SH3p6btCdNYcFDJg5EXpS8vNfckMgqQVLGFeSDEpUI3N/e5OG0Nwn7xiAzbov964kEea
 L8loS5iHOTYjm1qrWICIwODU29bMDEfQnpvClQrj4vqIsndxW3YsaBXa5JMxbivqNjGr
 u3TP32j3msHZnt6b7ToUh1uv6y9KAH5IHYUBwgMRLvLbnIjiB8cFqM7NIBjHQ6nrwJpV
 g13IioVx1R525HVACDWbT3/QTkDW26FTVeeWPk0iblKDSPna8o1p94trVE35hGhofsAp
 cOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+3Nc6zEdR43z3razwv1XE8PU4kQ0+jJ55RCBwOavKuA=;
 b=RdwAe/DZ6sYQnZfSz6XJsc3x8uxgv+ujc5StjY3yzL1By5z33kCBqfqoGofZD7APH8
 C/GHdW3EcpuV8+S/d01T+qOln5pJ/Fxt82GmEPzclqnpHZCYn/NcMpwCU37/aheq3ly6
 kyDKIEN0lLVTKW7WCpC/wMjxHxXMYkObjiKU9MrcbkRfOTkvwr8OMI8WlcEN0ktoZYd5
 VHb3wASAQQASbo/DuM1+pJUztwJjH6AalonA65wXlLUHOhdIGuH60l3yVV9kPP2QB+3t
 7e+fhnDUhjtEqEeGjAfPsirS0+ZBbSwvieUmByqDMHJpfBW9eaDN3S63rKucqw6TK9k1
 13AA==
X-Gm-Message-State: AOAM532I3cwGzLj/Z+sWcNC10MbMj1N3AJoCOEyVXK9yjQGwQfTfo8i6
 5N0fwb0MC1uYZf5RqhgftrxIENXFTxo/+A==
X-Google-Smtp-Source: ABdhPJxHODe4fb/rT3lPIHwubYbtgR/QsnnvRLSNMKU03+ATwD3Z8EkNtp3XG3dy6+NN7vt9d4gYNA==
X-Received: by 2002:adf:f5cd:: with SMTP id k13mr175266wrp.673.1641566205287; 
 Fri, 07 Jan 2022 06:36:45 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id e12sm5346255wrg.110.2022.01.07.06.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 06:36:44 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <9c8adbbf-e80a-894f-48e5-cf8f35093d4f@amsat.org>
Date: Fri, 7 Jan 2022 14:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v4 11/11] hw/riscv: virt: Add PMU DT node to the device
 tree
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220107004846.378859-1-atishp@rivosinc.com>
 <20220107004846.378859-12-atishp@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220107004846.378859-12-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Fri, 07 Jan 2022 14:36:49 -0000

On 7/1/22 01:48, Atish Patra wrote:
> Qemu virt machine can support few cache events and cycle/instret counters.
> It also supports counter overflow for these events.
> 
> Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
> capabilities. There are some dummy nodes added for testing as well.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   hw/riscv/virt.c    | 38 ++++++++++++++++++++++++++++++++++++++
>   target/riscv/pmu.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>   target/riscv/pmu.h |  1 +
>   3 files changed, 84 insertions(+)

> +static void create_fdt_socket_pmu(RISCVVirtState *s,
> +                                  int socket, uint32_t *phandle,
> +                                  uint32_t *intc_phandles)
> +{
> +    int cpu;
> +    char *pmu_name;
> +    uint32_t *pmu_cells;
> +    MachineState *mc = MACHINE(s);
> +    RISCVCPU hart = s->soc[socket].harts[0];
> +
> +    pmu_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
> +
> +    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> +        pmu_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> +        pmu_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_PMU_OVF);
> +    }
> +
> +    pmu_name = g_strdup_printf("/soc/pmu");
> +    qemu_fdt_add_subnode(mc->fdt, pmu_name);
> +    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pmu");
> +    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);

pmu_cells[] is not consumed...

> +
> +    g_free(pmu_name);
> +    g_free(pmu_cells);
> +}



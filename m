Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYv8Z-0001V8-Ke
	for mharc-qemu-riscv@gnu.org; Sun, 05 Mar 2023 15:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYv8S-0001RA-7b
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 15:39:13 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYv8N-0004g1-Q3
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 15:39:10 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so9429311pjn.1
 for <qemu-riscv@nongnu.org>; Sun, 05 Mar 2023 12:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678048745;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=FBZew2YyAcU2WgNIeB8kiidwVhfJyO8s4Ebg9j4kTp8=;
 b=yl0WBOOjGY6a9tTV5js7ghxkcO6T3mcVYEzvG1R6FRfveOA/c8ezDmFasqFq0oKvid
 GRCkw067X0ycujIF2eXI0W9lmLzYqMv4NJMGFsnf1QHLEUC+NZxcCqwn4MHV4PPMxm6O
 gU1aUIZRVADYTlqO+VFUxXI0ch5MnG20KTzoMFHwZ3Gv34WH1soFe8Bne83G+Def0b1x
 PIX/sL+u4xH1zQGdbR7ahMcLnwMabbeEKliRs7A9Nm3KkJA1GFvSWja0tor0xsBrNlNF
 Cr5IvOtEX2b1MHRIkZ5i6NrAtZE8WfEgeabBvleenzsxD7VrrhMKZl+wbwz2c5KT1euR
 tljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678048745;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBZew2YyAcU2WgNIeB8kiidwVhfJyO8s4Ebg9j4kTp8=;
 b=mpWCk6RkwL1WVA6v7Slufd+516/brk+I4A1+dnh30HSAkD7c5u2YR1QSyxG4NEgP9f
 TqkBVeW8ZXjwNRF1iHigMeVix68svNf0CfNxMyv99xTMYqkSzqxIavfv68EFPYpC4U/o
 GG3TQDMOC0N4/rSxXAmb5N38AYsmPlnY2/ArMi143FCLRKHDQBh2qItOPB5gKtT+aDBQ
 cT6dhcAc5yvxkwFELcHIHgc6qb3wt1172GIwDaGp03axIxD8Vs/W9kPekcVkKljhMlNk
 l4W6NUduz5JCUZvigu1CryGe3ixYN4hauSJTRP/Z4XTr7iVse+t9KkybE2f+5VDhMAej
 reUQ==
X-Gm-Message-State: AO0yUKVCbkEOOdOAOPcXQ/RP0vADqU8VCTwotLuvHfR6FSYf2ldSnxrl
 KoUBtyNL8KMqhrISPNA6q+91jg==
X-Google-Smtp-Source: AK7set/gUlwwRlRX02FummTRPnHFXJE+6qMGFIkyNzTOgXobEcer9o4dI4YudIaIQQ6Nyo6Vzj3P4Q==
X-Received: by 2002:a05:6a21:9998:b0:cc:d514:62ce with SMTP id
 ve24-20020a056a21999800b000ccd51462cemr10859240pzb.44.1678048745539; 
 Sun, 05 Mar 2023 12:39:05 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 b4-20020aa78704000000b005a8c60ce93bsm5078554pfo.149.2023.03.05.12.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 12:39:05 -0800 (PST)
Date: Sun, 05 Mar 2023 12:39:05 -0800 (PST)
X-Google-Original-Date: Sun, 05 Mar 2023 12:30:40 PST (-0800)
Subject: Re: [PATCH v2 0/1] hw/riscv/virt.c: add cbo[mz]-block-size fdt
 properties
In-Reply-To: <20230302091406.407824-1-dbarboza@ventanamicro.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 dbarboza@ventanamicro.com, ben.dooks@codethink.co.uk
From: Palmer Dabbelt <palmer@rivosinc.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-d2c8db08-7fd6-46f9-81f2-db42d35c2539@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 05 Mar 2023 20:39:13 -0000

On Thu, 02 Mar 2023 01:14:05 PST (-0800), dbarboza@ventanamicro.com wrote:
> Based-on: 20230224132536.552293-1-dbarboza@ventanamicro.com
> ("[PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions")
>
> Hi,
>
> This second version, which is still dependent on:
>
> [PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions
>
> Is adding the cboz FDT property as well as requested by Ben Dooks. First
> version refrain from adding it since it's still under review in the
> kernel but, given that we have cboz_blocksize already available, it
> makes sense to also expose it like we're already doing for
> cbom-block-size.
>
> Changes from v1:
> - also add riscv,cboz-block-size for Zicboz
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg00368.html
>
> Cc: Ben Dooks <ben.dooks@codethink.co.uk>
>
> Anup Patel (1):
>   hw/riscv/virt.c: add cbo[mz]-block-size fdt properties
>
>  hw/riscv/virt.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Thanks, this is in the queue.


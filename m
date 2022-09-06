Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVXkW-0006yD-K1
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 08:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVXkU-0006sz-FA
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:32:14 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVXkS-00066L-GH
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:32:13 -0400
Received: by mail-pl1-x629.google.com with SMTP id s14so1565156plr.4
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 05:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=mOaRI71FQfWA04xw1hixx4MODTWCMqP/3VREdkQGoTQ=;
 b=obTj/T8nL2vtJfjjzCT6VXoOERiCp+1ugivm4/FUM4PhsjKVXRe38OSQBV4jERCsBp
 ugGLkBxK943bn9kGeNzx3oTQIjewFzShMkdiDYel004C5o33G0Wk5ljqrPcmpxC/TjWi
 4c1znbedjNRguLE3cq1e8rCD/KMM/CV2bH5Vn44p1FjB5vMcM8w3XUbDO/u4DGCNdyBq
 LdUEv5ladW0YDSch3pSNsyxgUOkFa15BUwL6W/CYoDRKtjbpBNYEReavZbajRqAZvYvT
 97OtcOMpZsRxLOOtRTszyQK1D2bK2nQ2hh/sQZnp5Zq5boIlUXC5JREl7qJC2QDRgASE
 vgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=mOaRI71FQfWA04xw1hixx4MODTWCMqP/3VREdkQGoTQ=;
 b=bJxvKjLk53W8n93pkLy95NjOeIbvS5Jg+2xbmz88/hZEG6OoWHp4SR+pvtGhtQnBA9
 55E/ce762HAp0GdEvxMzxsV3ZEYqdrJhvHXjFBR7L5astVAIGGH41f7Fooo8PQH/Zh5s
 NnvU6Oyu5rAWgPQcmJrEmUqPz7YRw/LRGhKP2AZVCfoWaIqUADoPvTScJjltLtSnOaXW
 LDWDgti4cWmXNp3bXFbKIv4AJEgRVqNY5WC6+yU/9dT+fqcY49HYiVRAuwfRefWq9oXy
 Hfgs7sb02ghxRWvbGb6CxWyiv4zk/dX5r2WrX/E46TBpYluRewZP2OF1GKN5fhrCC6Pk
 cv8w==
X-Gm-Message-State: ACgBeo3g2i3OmVBIvuzkDhxqhIgAo/5o09o/MvT2XsZaDgB/xbMfllhZ
 8Ug5HwqQsH2o3W2l8VdKIjn3VA==
X-Google-Smtp-Source: AA6agR5iC55Y4ksQL9+J3hn+jTD16yAHYcEX9R2AzZRwsjgaF75756oraVYS/j/hfJpE9lnY6upuZA==
X-Received: by 2002:a17:90a:9409:b0:200:52d9:660d with SMTP id
 r9-20020a17090a940900b0020052d9660dmr11901049pjo.62.1662467531040; 
 Tue, 06 Sep 2022 05:32:11 -0700 (PDT)
Received: from sunil-laptop ([49.206.11.92]) by smtp.gmail.com with ESMTPSA id
 v13-20020a17090a00cd00b001fa80cde150sm12368806pjd.20.2022.09.06.05.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:32:10 -0700 (PDT)
Date: Tue, 6 Sep 2022 18:02:00 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V4 0/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflash
Message-ID: <20220906123200.GA237800@sunil-laptop>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906104128.zlwzvbbswlzyplkc@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906104128.zlwzvbbswlzyplkc@sirius.home.kraxel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 06 Sep 2022 12:32:14 -0000

Hi Gerd,

On Tue, Sep 06, 2022 at 12:41:28PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > 3)Make the EDK2 image size to match with what qemu flash expects
> > truncate -s 32M Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd
> 
> Hmm, we have that kind of padding on arm too (64M for code and 64M for
> vars) and only a fraction of the space is actually used, which isn't
> exactly ideal.  So not sure it is a good plan to repeat that on riscv.

Yeah.. but it looks like limitation from qemu flash emulation. Do you mean
this limitation exists for arm in general on real flash also?

> 
> Also: Do you have support for persistent efi variables?  If that is the
> case then it makes sense to have separate pflash devices for code and
> variable store.  First because you can map the code part read-only then,
> and second because decoupling code + vars to separate files allows easy
> firmware code updates without loosing the variable store.

Yes, we have persistent variables in my WIP branch. We can easily make it
to create variables as separate file in EDK2. But we will need to
enhance qemu virt machine to create more than 2 flash since the first
one is currently reserved for machine mode firmware. This is a
good input to enhance it in future.

Thanks!
Sunil

> 
> take care,
>   Gerd
> 


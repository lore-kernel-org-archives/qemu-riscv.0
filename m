Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJu4n-0000sT-CL
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 05:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJu4m-0000sC-6V
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 05:29:20 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJu4j-0001MM-GJ
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 05:29:19 -0500
Received: by mail-ej1-x629.google.com with SMTP id v6so29200225ejg.6
 for <qemu-riscv@nongnu.org>; Mon, 23 Jan 2023 02:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b0oXK1SdRy74tLtiMX3fYKJ2HnHYK6rsSmwH4fzUscU=;
 b=ahfiun4Tijo6PquHjRJjf6KlQrrIdB8XKm69mCw5oJvxKuzeGShObomjrnu4KngRlw
 8pVznH9uGVp+xab01oRTOiVBN0voMbxJ31Pt1IeZ6aPaW30FqUcMnHbW97DEpJfrgh5C
 g5Xpe3307g0ExkRIRPsSDAinCbne9l5xew/GkCPy4fHeBLD2gkM5siOfWFTQdQvcqkz2
 qnt7VsWbqpiYCk/xLPLk0KXIHvUoSLbJZP5KVphH8AY97U+p8C3wY5waAc6olyvMPNcp
 Kv+F3CmfnOjfYpIxgZeAEFAmYub3zmsN6P2jAXT5xUs+F9fQqgqmdqWrqGJQcCopp3DY
 e8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0oXK1SdRy74tLtiMX3fYKJ2HnHYK6rsSmwH4fzUscU=;
 b=73VDsjmAGYK+QXLyNpwXC/s/aL3OlH81GsVbcMRpr2kecBIdPpjwYGdYJD+Vu6CY6p
 kavvyeH6mfB0MGwBG5ObktylUtKX1vtOWnMYzMlX1R4ElndJ85Tfoz1TphkP6qn+t307
 VO4rKoUf4rpdYebL7TnW6rEF/tkiWHq25U1nuhoIV1YsQ3QyNcyiiNIqVnooO4G9iE6e
 /8kgjL8wWxCFJeFD6hA/EzAfOIhduSRnNzeIr4cH84V/CAkXQC706AHfU+9nRfbdDTwe
 4JUJEy6/vz/RVIlawkpDaJoBBWmCxMykyEWr/VWU7q0u+hAfUWhtmErZ0WCprf5IQfsO
 4Hsw==
X-Gm-Message-State: AFqh2kqk2MobaiWtQKolP0kR9hSTqBWSr5xgbXTnQydXjaNQi1iFAOTG
 BQY0LBeYTMf3MtPBKNChm9kZMg==
X-Google-Smtp-Source: AMrXdXsJVlJ6kY47pB1tE2A7cm4P8SwWyJPuWSvJnu8u4XKLHbAvyMOxrg6Yy8ofddTFs4JqqGS2Aw==
X-Received: by 2002:a17:907:2a07:b0:86f:4a4e:4853 with SMTP id
 fd7-20020a1709072a0700b0086f4a4e4853mr22048541ejc.49.1674469754206; 
 Mon, 23 Jan 2023 02:29:14 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 ti3-20020a170907c20300b0087190b46ab0sm10616325ejc.76.2023.01.23.02.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 02:29:13 -0800 (PST)
Date: Mon, 23 Jan 2023 11:29:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v6 3/5] riscv: Allow user to set the satp mode
Message-ID: <20230123102912.kq5c47nzeg7ufkma@orel>
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123090324.732681-4-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 23 Jan 2023 10:29:20 -0000

On Mon, Jan 23, 2023 at 10:03:22AM +0100, Alexandre Ghiti wrote:
...
> +/* Sets the satp mode to the max supported */
> +static void set_satp_mode_default(RISCVCPU *cpu, bool is_32_bit)
> +{

nit: When passing in the cpu object pointer there's no need to also pass
is_32_bit, we can just use it from the pointer, cpu->env.misa_mxl == MXL_RV32

Thanks,
drew


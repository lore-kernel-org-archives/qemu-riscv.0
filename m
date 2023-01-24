Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKG6X-0004Ne-0o
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 05:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKG6Q-0004Mo-BB
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 05:00:32 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKG6M-00070D-V1
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 05:00:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id d14so9628266wrr.9
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 02:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pGtRppymZ7AwyQQoeY/s9C+Ffa0l96MxnwycTDdkkBg=;
 b=gzTkBWRD87vXK6T7z88q6A7ddLQhDkPvK09cPQ7uzpxXL6wlkSvjRvAmDhHsojZvjh
 NpXQRYHgxffUGyxhgPdxjX0vix3JJcZqeYxDHPS+56BK8G96D8pNczZ29eYyp7tsO7YP
 VPLGxJnGxagBtc+NG3zEfDw9ytHITFlo3NUa6qgfbfBWsxlAK/RuVpeWJGarkhuiooYW
 XwvQWPlPGWsxl4cDKDVA2PaRR+dpIw+0MAmEN0jpzes1lhB8TeR/pOs47dqRycfAeENF
 oWge+SyqAFwkuUGviEwTWy7syBNQh+C9VC3mg10YGWpgRlgI8hV3g1iW/uYQWlykA90x
 KqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pGtRppymZ7AwyQQoeY/s9C+Ffa0l96MxnwycTDdkkBg=;
 b=52fKdAVsJqCOxem61LuheY+TNb5kCYR/llrWIPGdoJShyLQKHvXNcuzEmXGyDcCLJf
 wRnkEC43rd+ASRUDY1yyDGkHOFa6W07DDWSZaEtT29rrwIgMHeE4HMDFoZVZjh5GnQEf
 hxlBP6CLVTBJanKHlQ/OmlsHa/gSRtypp2Msz4YFI9CBfy98IXBozULbwN81G2t7GdTA
 E2lDtqP6LcePLRygHqH3K1MjP2hnyBldqQc/CxmmUsW0GuCXCI40AQKAKIcFob0MNtGP
 QcPmk3jFS5RHKROnP/JYO/mbHzubeL+y5xF6MlGsx4R23qn0eA38my5o8Al+eKb4swnY
 6cvg==
X-Gm-Message-State: AFqh2kpukBHr7+tuq2pTene4ENQJuVpyGVbR3Q6B6wM+QY2sAbW8cNVA
 XmZN1erFhNr1cKdGCEsm1m2FeSJtg5pctPq1OKW1+A==
X-Google-Smtp-Source: AMrXdXuyYMOCzLXcIphcFfNs6XFSfeWGZLDPy32bhvZW+vR9WLx06XdjIdgYcaJFGrRT/0xYOWVnnhTghMRqK217gWI=
X-Received: by 2002:adf:f650:0:b0:2bd:dd46:99b7 with SMTP id
 x16-20020adff650000000b002bddd4699b7mr1247571wrp.108.1674554425328; Tue, 24
 Jan 2023 02:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-4-alexghiti@rivosinc.com>
 <20230123102912.kq5c47nzeg7ufkma@orel>
In-Reply-To: <20230123102912.kq5c47nzeg7ufkma@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 24 Jan 2023 11:00:14 +0100
Message-ID: <CAHVXubi_4znHQ0yJYFR3UJ1adRE0yhECwb=Wohza26bucAKjEA@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] riscv: Allow user to set the satp mode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 24 Jan 2023 10:00:32 -0000

On Mon, Jan 23, 2023 at 11:29 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jan 23, 2023 at 10:03:22AM +0100, Alexandre Ghiti wrote:
> ...
> > +/* Sets the satp mode to the max supported */
> > +static void set_satp_mode_default(RISCVCPU *cpu, bool is_32_bit)
> > +{
>
> nit: When passing in the cpu object pointer there's no need to also pass
> is_32_bit, we can just use it from the pointer, cpu->env.misa_mxl == MXL_RV32

Ok

Thanks,

Alex

>
> Thanks,
> drew


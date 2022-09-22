Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obKOK-0004rS-E3
	for mharc-qemu-riscv@gnu.org; Thu, 22 Sep 2022 07:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1obKOC-0004nW-CA
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 07:29:12 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:37534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1obKOA-0005rk-H0
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 07:29:08 -0400
Received: by mail-pf1-x431.google.com with SMTP id a80so8998861pfa.4
 for <qemu-riscv@nongnu.org>; Thu, 22 Sep 2022 04:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=fo1pguXh35GJwhNNLgr8GCOVMf6DDqTSk5GZgvqY2vc=;
 b=b+lpv+RJFA2TNM1Oen1FGhdlyeRW3Be8+C1Mw0KR6DmzfXoVUyHWPcBwYmQhlNZ+ys
 ZQCp5HbsN4Tg5wu97qvSVdXWmPnJEa0vAW8yoWedbkr3W8pB7H73DMvB4MP+mKQKLGfV
 hI0AEC2ATJJPRmIC8voa3Uh4As2XwCsetjY7GAUZQe5TI+sl0pocTWxRJn+Zaujt3dEI
 wyWAPavI8HJTEo5L/wXQeMLr/iDvXwSINraRBpHkuNy/ISU8GLUawxd2MaxJC3Y4tMaG
 xUqrTMyE3/5/ktGPjfmyxJ3Vjz32qJlMhxv/32eQcKOzufMxDbqykr59nHqEKoUhMhQM
 nr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fo1pguXh35GJwhNNLgr8GCOVMf6DDqTSk5GZgvqY2vc=;
 b=hJzKuyVTbVMmMUv9/h0kf4PVrf1/cXbMpLGx24b/dbvlOYIo04K01bVOKHrYUFt0n1
 iuxkO4f6jvGbn9GlGu4fStLKJ8TemO7UbKfvbZADbIakYrXjF8/9IFGIOQRQRtjs/J7I
 Q+cSSMpoyWniAZiwAQrcAWK7SX58dr+vlT5fKuFPcYsYhHfS7vlJUFAsQbT8ara3WCZ7
 WhMgASzaAdqRseZsBLKgB7H7aLQ9bbA9XP9l7RrLB0K3nrGHydCSesErgzBHc6IxX1Vk
 eUeIEYzOVXNAZApj2cq6Ly/bfqfflsBWDy+Q0Dgas6Vnb+SqfCht6ZJoGSfrB+DgIkOK
 zEuQ==
X-Gm-Message-State: ACrzQf0DqEacai9RpdMoUyKjDziYEzxAl1niAfqeHRzcKVCdw9bJoXR+
 atx3oL22LvhfV2ZDA8fRWnXJVw==
X-Google-Smtp-Source: AMsMyM7dN/wl7oBJUheshXt14cDXAKeGn6mbNPTJHJ+s5CQHC2zj/qS4fXA32j3cKE53QlKGVI9OIg==
X-Received: by 2002:a63:88c8:0:b0:439:494d:fd10 with SMTP id
 l191-20020a6388c8000000b00439494dfd10mr2596274pgd.201.1663846143666; 
 Thu, 22 Sep 2022 04:29:03 -0700 (PDT)
Received: from sunil-laptop ([49.206.11.215]) by smtp.gmail.com with ESMTPSA id
 k18-20020aa79732000000b00545832dd969sm4213443pfg.145.2022.09.22.04.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 04:29:03 -0700 (PDT)
Date: Thu, 22 Sep 2022 16:58:54 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: gaosong <gaosong@loongson.cn>, Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V4 1/3] hw/arm, loongarch: Move load_image_to_fw_cfg() to
 common location
Message-ID: <YyxG9qmImWgcT0tI@sunil-laptop>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906090219.412517-2-sunilvl@ventanamicro.com>
 <CAKmqyKOZSaE9CYGmYSKOEnkQkGDUkchut+i2mQjcZLSVx-qWag@mail.gmail.com>
 <YyMTpMuQ0UP9Mqaz@sunil-laptop>
 <2ecd4eff-d0a4-a140-5dd5-b4de89040189@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ecd4eff-d0a4-a140-5dd5-b4de89040189@loongson.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Thu, 22 Sep 2022 11:29:15 -0000

On Thu, Sep 15, 2022 at 08:56:01PM +0800, gaosong wrote:
> 
> 在 2022/9/15 下午7:59, Sunil V L 写道:
> > Hi,
> > 
> > Could maintainers of hw/arm and hw/loongarch to take a look at this? I
> > have addressed Peter's earlier comment.
> > 
> > Thanks
> > Sunil
> > 
> > On Thu, Sep 08, 2022 at 11:17:52AM +0200, Alistair Francis wrote:
> > > On Tue, Sep 6, 2022 at 11:38 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > > load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> > > > function will be required by riscv too. So, it's time to refactor and
> > > > move this function to a common path.
> > > > 
> > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > 
> > > Alistair
> Reviewed-by: Song Gao <gaosong@loongson.cn>
> 
> Thanks
> Song Gao
Thanks Song Gao.

Hi Peter,

Could you please provide RB or ACK if things are fine with this patch?

Thanks
Sunil


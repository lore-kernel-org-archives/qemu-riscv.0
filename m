Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801F2C7EE23
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 10:21:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2UYs-0004DC-9N; Fri, 26 May 2023 06:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2UYo-0003sh-Jq
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 06:20:39 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2UYi-0002vv-9v
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 06:20:38 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-546ee6030e5so297322eaf.3
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 03:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685096431; x=1687688431;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cLiiP+jlHwaI32KtPjgYDFSA6CE1tRD8Cr27j9ZLDEA=;
 b=eLxklvDFQjfFEDXZWC3xdytpevCyGBjyYXfFuzqIiLMc2uIrGyZPEPRQjbzpJH3PWg
 iK+yVFuWxysCPnk1+KO+an1abOn6rrkHSz8Pta1kwkIXeO33NzM4KOHnCQqmbpsts6wD
 SuDo3hzjBWAZSYX5WUBKXWGFmMz44+Iea4fJNxXCl01Hl/Sv07vdQd+JI22SWCweA6VV
 7f0QY+ATjsvPAz22VGTUFFtHHKAeNeu3f7BlBhly8hbPspCK+ViaLMlfiIxUJKa8QX2E
 qJt9JXQeUc5D1F6rUdUJqk7Cepr5giZoXXC5LwW4okTl/bV77cwHm7mMuBQAjBMFSu31
 MsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685096431; x=1687688431;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cLiiP+jlHwaI32KtPjgYDFSA6CE1tRD8Cr27j9ZLDEA=;
 b=TGtvglcX+sN6wgbooYLwauXbhAtgi+9ooSQ0LEB/ZGzDviG3HCWctsloqmpk/nPAX/
 d8g8iQuT/Uzv4cHawKLPdafiUL+q7wYQsVwyGgsdPLHTIRbM9PGOoazacGuYThjdDyIw
 rArNSTBhKPynIZ39sgfxp+GYEb78saiqv56FA3Ukxm+7eP/EQllg011QvWlIxqPY5fOZ
 kupXSrT3uI1ziSmIsOMTBad8xsCQMemhk1xcW9aK7tI10bkeB3e9b1TXlr622NjcZno4
 FwOMtDLVqZFed20Cqt4vdCbxNp96ziYE1eT4hVvFur9dsxhp9LlEQH9m3cccOo2ZI8KA
 eYDA==
X-Gm-Message-State: AC+VfDzoDvXiiTLt83di3hFQ/72uVwgFYAyBEUk5lqC7P5kqBEn07OJa
 RgJ8nTwydyB2ug7HrQdtNOrVJQ==
X-Google-Smtp-Source: ACHHUZ4GDVTXNA+vOr0iwt0EbrV5Bcpc6oWf+eG2Rl+HIc02JcYvO8zRhwet6WanU6BzY01B3u2erQ==
X-Received: by 2002:a4a:49cd:0:b0:555:8c22:a169 with SMTP id
 z196-20020a4a49cd000000b005558c22a169mr654503ooa.9.1685096430804; 
 Fri, 26 May 2023 03:20:30 -0700 (PDT)
Received: from sunil-laptop ([106.51.186.3]) by smtp.gmail.com with ESMTPSA id
 r14-20020a9d7cce000000b006a6558ef17fsm1562474otn.30.2023.05.26.03.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 03:20:30 -0700 (PDT)
Date: Fri, 26 May 2023 15:50:22 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH v4 2/3] riscv/virt: Support using pflash via -blockdev
 option
Message-ID: <ZHCH5mouRT5KdMt5@sunil-laptop>
References: <20230525164803.17992-1-sunilvl@ventanamicro.com>
 <20230525164803.17992-3-sunilvl@ventanamicro.com>
 <dbfd6f2a-1ff4-7baf-8ff4-0d47a97f5ff4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbfd6f2a-1ff4-7baf-8ff4-0d47a97f5ff4@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, May 26, 2023 at 11:53:18AM +0200, Philippe Mathieu-Daudé wrote:
> On 25/5/23 18:48, Sunil V L wrote:
> > Currently, pflash devices can be configured only via -pflash
> > or if=pflash options. This is the legacy way and the
> > better way is to use -blockdev as in other architectures.
> > libvirt also has moved to -blockdev method.
> > 
> > To support -blockdev option, pflash devices need to be
> > created in instance_init itself. So, update the code to
> > move the virt_flash_create() to instance_init. Also, use
> > standard interfaces to detect whether pflash0 is
> > configured or not.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reported-by: Andrea Bolognani <abologna@redhat.com>
> > ---
> >   hw/riscv/virt.c | 15 +++++++++------
> >   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> 
> > @@ -1265,21 +1267,22 @@ static void virt_machine_done(Notifier *notifier, void *data)
> >       firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
> >                                                        start_addr, NULL);
> > -
> > -    if (drive_get(IF_PFLASH, 0, 0)) {
> > +    pflash_blk0 = pflash_cfi01_get_blk(s->flash[0]);
> > +    if (pflash_blk0) {
> > +        flash_mem = pflash_cfi01_get_memory(s->flash[0]);
> >           if (machine->firmware && !strcmp(machine->firmware, "none")) {
> >               /*
> >                * Pflash was supplied but bios is none, let's overwrite the
> >                * address we jump to after reset to the base of the flash.
> >                */
> > -            start_addr = virt_memmap[VIRT_FLASH].base;
> > +            start_addr = flash_mem->addr;
> 
> I don't understand this change. Besides you access MemoryRegion::addr
> which is an internal API field.
> 
Thanks Philip. This is not really required. I was trying to avoid
depending on memmap base addresses and dividing the memmap
range by 2 to get the second flash memory base etc. Since we have
created MemoryRegion already which has the actual base address for each
pflash, I was thinking to avoid this hardcoding. But I didn't realize I
am accessing the internal field.

Let me revert this particular change.

Thanks,
Sunil


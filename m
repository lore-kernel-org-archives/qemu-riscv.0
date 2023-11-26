Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88337C4167B
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 10:02:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7Bxe-0002Iq-77; Sun, 26 Nov 2023 05:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r7Bxc-0002Gt-0O
 for qemu-riscv@nongnu.org; Sun, 26 Nov 2023 05:01:56 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r7Bxa-0007dp-0l
 for qemu-riscv@nongnu.org; Sun, 26 Nov 2023 05:01:55 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-332fd78fa9dso171964f8f.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Nov 2023 02:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700992911; x=1701597711; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sWamtikRUf1sDqGW+Z56O+5DFooywPqde+YI6Lz5I54=;
 b=mlCZHMLtWQPizcgbR/lkP2xA1aLQ8oDKrid5ihLej5tSntaqN3z0hsim+LvqbJ51oK
 hetTCV/lvDfSCPEVl/8SculEGG//2b+mDAibPd03YFwVdJv9S85sTiobquf5jC3BOj6u
 y1pZWe6ei8avv5IQKJnkGFH0ewa5dPqSS4AV5+sIqF7HqePvgUC7/UXrUw0fKQFWfoBj
 nlFCYAPWbTVCyIfMHcgIhwBDMq/Htj92AZIMB6jxrAS2P+st6MOaIAHPu0WwdkdDGDPq
 4nlmup19Qalg4a8VL+al8ErU7udaxqMy3hBSjY/U6j7yDTi2ab0nGkhcdLXHBvUOiTWj
 q3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700992911; x=1701597711;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sWamtikRUf1sDqGW+Z56O+5DFooywPqde+YI6Lz5I54=;
 b=rdSug9o7J0o1lEd1OkRXtDnGCXupJ3F/by6oqRHb4yf5kvmuZODD+tjGvaFSRYNj7a
 mXuhXzZ3T7u1iZpSN09f0kxeqc+UpMu/DO/Bqr7ziuTTxtqlF+x8rttqB3h2r1T/Lkjg
 JwgoXyqJk2v9otxEKSN8cbLFaKNHy8NpVKWZA3Ah+oJI3WfZERio/HkCBjO71dKvE8iF
 /n5Jm2jL4aUWMkRF7Ixv/kXxgpLBmLiSwLxk6AcJsXZip8nJ3T6IZ7vIh9smjUnteZ9c
 4S6rrlvQsK82R1TbW7Zev5CBTIYLcAwZOyIpE/ockvnPCRrlakd2dO1vjchJA9QotQta
 0Spg==
X-Gm-Message-State: AOJu0YwU/RtYxLBpd/DQlkpJLZJjtjgCXEuxcAiN73NsXM45MJ+5/fu2
 BeIjUXKjojQhA45PTzB0KNH9Cw==
X-Google-Smtp-Source: AGHT+IHZzkyWKfg8Pd3elx0pBvu0sF7/fkjTjGCJMQ69hkt9KVgXj9clvKEGu8ueKatkB3RrvnJzKw==
X-Received: by 2002:adf:f5c1:0:b0:332:f895:f599 with SMTP id
 k1-20020adff5c1000000b00332f895f599mr1734940wrp.29.1700992911365; 
 Sun, 26 Nov 2023 02:01:51 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 2-20020a5d47a2000000b00332ff137c29sm606226wrb.79.2023.11.26.02.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 02:01:50 -0800 (PST)
Date: Sun, 26 Nov 2023 11:01:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Christoph =?utf-8?Q?M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] linux-user/riscv: Add Zicboz extensions to hwprobe
Message-ID: <20231126-fbb9c420dec7ea31141cb367@orel>
References: <20231123181300.2140622-1-christoph.muellner@vrull.eu>
 <20231124-b892dc7ca5a5f9ff4cceda6e@orel>
 <CAEg0e7hy2Z+X7TR8iaQckCHZ2NGyPJV8dioco-FB2aPErMpnOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEg0e7hy2Z+X7TR8iaQckCHZ2NGyPJV8dioco-FB2aPErMpnOQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Nov 24, 2023 at 06:41:25PM +0100, Christoph Müllner wrote:
> On Fri, Nov 24, 2023 at 5:59 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, Nov 23, 2023 at 07:12:59PM +0100, Christoph Muellner wrote:
> > > From: Christoph Müllner <christoph.muellner@vrull.eu>
> > >
> > > Upstream Linux recently added RISC-V Zicboz support to the hwprobe API.
> > > This patch introduces this for QEMU's user space emulator.
> > >
> > > Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> > > ---
> > >  linux-user/syscall.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > > index 65ac3ac796..2f9a1c5279 100644
> > > --- a/linux-user/syscall.c
> > > +++ b/linux-user/syscall.c
> > > @@ -8799,6 +8799,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
> > >  #define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
> > >  #define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
> > >  #define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
> > > +#define     RISCV_HWPROBE_EXT_ZICBOZ   (1 << 6)
> > >
> > >  #define RISCV_HWPROBE_KEY_CPUPERF_0     5
> > >  #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> > > @@ -8855,6 +8856,8 @@ static void risc_hwprobe_fill_pairs(CPURISCVState *env,
> > >                       RISCV_HWPROBE_EXT_ZBB : 0;
> > >              value |= cfg->ext_zbs ?
> > >                       RISCV_HWPROBE_EXT_ZBS : 0;
> > > +            value |= cfg->ext_zicboz ?
> > > +                     RISCV_HWPROBE_EXT_ZICBOZ : 0;
> > >              __put_user(value, &pair->value);
> > >              break;
> > >          case RISCV_HWPROBE_KEY_CPUPERF_0:
> > > --
> > > 2.41.0
> > >
> > >
> >
> > We should also add support for getting the block size with
> > RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE.
> 
> Hi Andrew, this is already upstream, just the EXT_ZICBOZ is missing:

Oh, thanks. In that case,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

drew


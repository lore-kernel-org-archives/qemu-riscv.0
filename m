Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ory7r-0008G8-E9
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 04:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ory7k-0008F3-P6
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 04:08:59 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ory7i-0007x7-Um
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 04:08:56 -0500
Received: by mail-pj1-x1033.google.com with SMTP id gw22so9962635pjb.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Nov 2022 01:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rd2lq5ksElHgZ+7844aSdBRInH9/UWMQ4PhblAlVBWM=;
 b=EI8e036vnbQDC8UHToH/x4yw4T9MkCJ3l5oP0ChJDUkmlZkrzzzl1Kqgz63HzaJoFU
 P/s6fu6i7HZrpyahkX9V5MD1yr9vXjyeIF0JLIDJExFxtyXbDBzR/go3E7tjR6gFZ02Q
 okGOF8BOCY24h4NhtuYM4VarSlXRvJSLiksi5k9nYP/Npf6QFH1+L3WmnuMRs/Shh6fh
 /1zvEAEirKWfk+kM61Z4EcyAVH9ur6jgBqn/GcpV+/vRBhou+jIaJXbkg5VQkNq0K7ub
 gdONoh8DhB4XO/w9kbqsfo2GaVbkp847tG+nf2k7C3nFEQ24L+obbZ/fG/RwrKKdVirQ
 fVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rd2lq5ksElHgZ+7844aSdBRInH9/UWMQ4PhblAlVBWM=;
 b=Ehf06vGeS0kWACBOAMoyO1mrk9kEvw3HH2VVInEJababiPGIVpz2kNxRa0HXAi3cbT
 Ywez2yRp7p8amJ9I5nlJ+MDBqif2IeCKlU6JkTyR1imB4vcepJ7lQS1ALI8+jtSKzwGN
 e4JAqFrYcuV19NOj7ZtQMk5+8er4UbsIh6tR725dj2nQyTLEHKSAVf6g3HRadiPMnYIn
 EVWHQRZEpFtdSEYObHlNxbRvnsCAo4eZb43VDgAN49dNiYOMbiapRbugEkA07oszQ3wI
 fKjk7WRK6egJuDJ1eySNzvybzgjYJzfHOXaxF4lazVPPLfCrV+9ER/c0ITLggTboDmXS
 sPTA==
X-Gm-Message-State: ACrzQf2FvVxVjIDENYHWKNJsiGiwb4xqaCiymaND9bfh6jSHqHNeTwxL
 3YBYT6aUA8hwEyEq59oZpYsgsw==
X-Google-Smtp-Source: AMsMyM4vhc9qdjYpm9zaPBYq6di48YJ7yLAJLpVZCVstr6WAHjpQl72KdUhFykeAkoE1kyKQz9nomg==
X-Received: by 2002:a17:90b:254e:b0:20b:7e26:f0a0 with SMTP id
 nw14-20020a17090b254e00b0020b7e26f0a0mr66166683pjb.203.1667812129374; 
 Mon, 07 Nov 2022 01:08:49 -0800 (PST)
Received: from sunil-laptop ([49.206.12.236]) by smtp.gmail.com with ESMTPSA id
 ch8-20020a17090af40800b002086ac07041sm3775910pjb.44.2022.11.07.01.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 01:08:48 -0800 (PST)
Date: Mon, 7 Nov 2022 14:38:41 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Mike Maslenkin <mike.maslenkin@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <Y2jLGV6xZxPNGrHR@sunil-laptop>
References: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
 <CAL77WPADAWY8+2FZSQ=4PRcuUrwuUQ22CU+NoVLABM_r+px0pw@mail.gmail.com>
 <Y2ibaoOzna0iT7Sa@sunil-laptop>
 <20221107084803.myuc77xssykljyxv@kamzik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107084803.myuc77xssykljyxv@kamzik>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Mon, 07 Nov 2022 09:09:01 -0000

On Mon, Nov 07, 2022 at 09:48:03AM +0100, Andrew Jones wrote:
> On Mon, Nov 07, 2022 at 11:16:00AM +0530, Sunil V L wrote:
> > On Sun, Nov 06, 2022 at 10:20:57PM +0300, Mike Maslenkin wrote:
> > > Hello Sunil!
> > > 
> > > What about virt_machine_done() function?
> > > kernel_entry variable still points to the second flash started from
> > > virt_memmap[VIRT_FLASH].size / 2.
> > > 
> > 
> > The base address of the flash has not changed to keep things flexible. So, I
> > didn't change this portion of the code to keep the changes minimal.
> 
> I think we should change virt_machine_done() to be consistent with
> create_fdt_flash() and also add a comment in virt_flash_map() explaining
> the base addresses are statically determined from virt_memmap[VIRT_FLASH],
> but the sizes are variable and determined in virt_flash_map1().
> 

Sure Drew. Let me update and send V2.

Thanks
Sunil
> Thanks,
> drew


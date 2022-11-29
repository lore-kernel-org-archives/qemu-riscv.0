Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozujC-0006mp-Iz
	for mharc-qemu-riscv@gnu.org; Tue, 29 Nov 2022 02:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1ozujB-0006jS-F8
 for qemu-riscv@nongnu.org; Tue, 29 Nov 2022 02:08:25 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1ozuj9-0005Z4-DF
 for qemu-riscv@nongnu.org; Tue, 29 Nov 2022 02:08:25 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v1so20546406wrt.11
 for <qemu-riscv@nongnu.org>; Mon, 28 Nov 2022 23:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3cSHdcWlvmNpCXuBmOL4KsVaEwCsXy0npif128TWXQY=;
 b=SNItKNF4kZGCPW1bseGPVE95M+gT7PeaMIOilh9dKaLc1LCC7ysmswBeQNQxTjAsTX
 xzXqIEIDU3STs6ERqfasQ/x36ibMdtyl3oMvTv6ybotF1+NK4dC0ukBH5hpfY/BAqzm9
 BHR1SzoqgPd5orqsUc2risyul1TBtCXxvWbJeMm5Q9A1vSIgqX98fRDybwAONgpLP6zE
 iC5e9kM4kYc9Hc03nCZmeLORz9xkXFnBfrRgQH+HY/7lx2wFSHy2n/ePW1lb+RUcaQOd
 HD1Ep3T8Uls6ix6ATVTrXN1Tq2Kt4l3ngkcpkicvkJIqc+oBP+ScHleLnoAqqu1OK0W5
 jwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3cSHdcWlvmNpCXuBmOL4KsVaEwCsXy0npif128TWXQY=;
 b=it0RGLgEoMgSTj9rS3Jv2HKiZI2JC83Tb5mtS9+BUH3vyYMzErnKwPu/7MIjPqL+FR
 KKlEMU/7flDIvpMAgdreilfQMn8anTzUqH8hhxTO6q5y1oQAzNTtC4TZGXvc7N0dDo1Y
 xd12kWGQ0DHFPC8DdBK+7y822uZolwK1Z5Hh2k9seq3hNxTPGbckMhbhE13kuefKGTGb
 sTEanBwBLnqXVhv5YNTaxcTgywnx9lL/PwL7v8ce4OP4JjfNaIPIGKvdU8jbgamsBJV+
 dI/aD97aj4aDhLQ99fDjYHxS/yT17Jxhmb0wCIagKun9tFqogTb0y17E5VbBw2xfE7Je
 CrnA==
X-Gm-Message-State: ANoB5pmeMit1ibziRGmGD3atr3FX7mfLsm57/XGlJ249x+NZa7g6xy3T
 sP9Mv9SFLLiHhqlmz3nY0aAWNQ==
X-Google-Smtp-Source: AA0mqf5TkVBAEEYUpXpOuNjRf5g0zN67MsVkX1X8NTTx7FhWSN/rv6fIdgyNXHUAKMWLnrfo+S9vsA==
X-Received: by 2002:adf:ed8e:0:b0:241:d7ce:4395 with SMTP id
 c14-20020adfed8e000000b00241d7ce4395mr25239479wro.553.1669705701573; 
 Mon, 28 Nov 2022 23:08:21 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 x8-20020adff0c8000000b00241f632c90fsm14548621wro.117.2022.11.28.23.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 23:08:21 -0800 (PST)
Date: Tue, 29 Nov 2022 08:08:20 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: atishp@rivosinc.com, qemu-devel@nongnu.org, alistair.francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, qemu-riscv@nongnu.org,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
Message-ID: <20221129070820.7varmruxjkhdwoc6@kamzik>
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <20220824221701.41932-5-atishp@rivosinc.com>
 <Y39urpX82uO85AAb@wendy>
 <CAHBxVyFhrkdhWpc4xB-_a4c5GnDu=d01-bk2zM2nCraeq_Xr_A@mail.gmail.com>
 <a3c7174d-6d33-5a34-0cd5-8ac340c052c3@microchip.com>
 <CAHBxVyGVigqBLLS9vqas+uq=Joyr2F6ir0zqtg+0y2GaTCyX-A@mail.gmail.com>
 <b42e75c6-8c52-025e-35ef-326537ccc90b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b42e75c6-8c52-025e-35ef-326537ccc90b@microchip.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Tue, 29 Nov 2022 07:08:25 -0000

On Mon, Nov 28, 2022 at 09:10:03PM +0000, Conor.Dooley@microchip.com wrote:
> On 28/11/2022 20:41, Atish Kumar Patra wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Mon, Nov 28, 2022 at 12:38 PM <Conor.Dooley@microchip.com> wrote:
> >>
> >> On 28/11/2022 20:16, Atish Kumar Patra wrote:
> >>> On Thu, Nov 24, 2022 at 5:17 AM Conor Dooley <conor.dooley@microchip.com> wrote:
> >>>>
> >>>> On Wed, Aug 24, 2022 at 03:17:00PM -0700, Atish Patra wrote:
> >>>>> Qemu virt machine can support few cache events and cycle/instret counters.
> >>>>> It also supports counter overflow for these events.
> >>>>>
> >>>>> Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
> >>>>> capabilities. There are some dummy nodes added for testing as well.
> >>>>
> >>>> Hey Atish!
> >>>>
> >>>> I was fiddling with dumping the virt machine dtb again today to check
> >>>> some dt-binding changes I was making for the isa string would play
> >>>> nicely with the virt machine & I noticed that this patch has introduced
> >>>> a new validation failure:
> >>>>
> >>>> ./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
> >>>>
> >>>> dt-validate -p ../linux/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
> >>>> /home/conor/stuff/qemu/qemu.dtb: soc: pmu: {'riscv,event-to-mhpmcounters': [[1, 1, 524281, 2, 2, 524284, 65561, 65561, 524280, 65563, 65563, 524280, 65569, 65569, 524280, 0, 0, 0, 0, 0]], 'compatible': ['riscv,pmu']} should not be valid under {'type': 'object'}
> >>>>         From schema: /home/conor/.local/lib/python3.10/site-packages/dtschema/schemas/simple-bus.yaml
> >>>>
> >>>> I assume this is the aforementioned "dummy" node & you have no intention
> >>>> of creating a binding for this?
> >>>>
> >>>
> >>> It is a dummy node from Linux kernel perspective. OpenSbi use this
> >>> node to figure out the hpmcounter mappings.
> >>
> >> Aye, but should it not have a binding anyway, since they're not
> >> meant to be linux specific?
> >>
> > It is documented in OpenSBI.
> > https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md
> > 
> > Are you suggesting that any non-Linux specific DT nodes should be part
> > of Linux DT binding as well ?
> 
> I thought the point was that they were *not* meant to be linux specific,
> just happening to be housed there.
>

I'm not sure if there's an official policy on where DT nodes should be
specified, but it looks like Samuel's opinion is that they should live
in the Linux kernel, whether they're used there or not [1].

[1] http://lists.infradead.org/pipermail/opensbi/2022-October/003522.html

Thanks,
drew


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLRUU-00034d-Id
	for mharc-qemu-riscv@gnu.org; Tue, 09 Aug 2022 11:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oLQ0I-0000Fk-7S
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 10:14:42 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:36411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oLQ0G-00085l-L7
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 10:14:41 -0400
Received: by mail-io1-f53.google.com with SMTP id q124so9665032iod.3
 for <qemu-riscv@nongnu.org>; Tue, 09 Aug 2022 07:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Qgyr+32CceGsT0l+h5ryRLscX/cbGb6A+xgqfxNnSjE=;
 b=Dq1WRGtCdWlKH0Aw4NTAadmAbcssZH/q70kKNqXsvNmZQdmYOf4RxKt0952gQMx7hw
 ATRX+WeheicnlGU39uly9nopn/3A4Aer8mKL+L8lq8a1gXLmowV6zYGInhaApeg0jEJu
 COXoLVVxY7lHQXHA8acmUPLF/QxG1vjUZ4Hy1WLjtX/HDz4Wz5cFwLG75zdtH6Uvy2ca
 +6vFdZKObeG82aA/nkPEDrRt6EblLG+nzUJletZHC70bUwwvb9ss25BkvsgDEFj45NpH
 jnjBnFTWWki1ivZ+28nPtgtPIqXFhK+MFAMakZVQr92ACELECd+80qQe4knpgOhr2uU+
 3KBg==
X-Gm-Message-State: ACgBeo3FtwmFsqKxjMfVHotPeUAmrYnd80slgDfsrMuI25ALEaEqf1h6
 U2jeSRTntBKOjtVYHsa/tw==
X-Google-Smtp-Source: AA6agR4Ha6qVwthQuAETuobnGoOie1LPqRZXH3lXZnPOwMUi0rO7JQSfIeH7D7YvlZQ/DynOPNiZxw==
X-Received: by 2002:a05:6638:1386:b0:342:8d69:71c2 with SMTP id
 w6-20020a056638138600b003428d6971c2mr10163189jad.315.1660054479123; 
 Tue, 09 Aug 2022 07:14:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a0566022d1400b0068226bcb7aasm1151011iow.38.2022.08.09.07.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 07:14:38 -0700 (PDT)
Received: (nullmailer pid 1746668 invoked by uid 1000);
 Tue, 09 Aug 2022 14:14:36 -0000
Date: Tue, 9 Aug 2022 08:14:36 -0600
From: Rob Herring <robh@kernel.org>
To: Conor.Dooley@microchip.com
Cc: jrtc27@jrtc27.com, tglx@linutronix.de, maz@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, daniel.lezcano@linaro.org,
 anup@brainfault.org, guoren@kernel.org, sagar.kadam@sifive.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Message-ID: <20220809141436.GA1706120-robh@kernel.org>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <YvGBYKZyW0B2/wSr@Jessicas-MacBook-Pro>
 <94fe7e46-6156-1cc5-a4dc-1eee78e99bc4@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94fe7e46-6156-1cc5-a4dc-1eee78e99bc4@microchip.com>
Received-SPF: pass client-ip=209.85.166.53; envelope-from=robherring2@gmail.com;
 helo=mail-io1-f53.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Aug 2022 11:49:16 -0400
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
X-List-Received-Date: Tue, 09 Aug 2022 14:14:42 -0000

On Mon, Aug 08, 2022 at 10:01:11PM +0000, Conor.Dooley@microchip.com wrote:
> On 08/08/2022 22:34, Jessica Clarke wrote:
> > On Fri, Aug 05, 2022 at 05:28:42PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> The device trees produced automatically for the virt and spike machines
> >> fail dt-validate on several grounds. Some of these need to be fixed in
> >> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
> >>
> >> Patches been sent that fix the QEMU issues [0], but a couple of them
> >> need to be fixed in the kernel's dt-bindings. The first patches add
> >> compatibles for "riscv,{clint,plic}0" which are present in drivers and
> >> the auto generated QEMU dtbs.
> > 
> > IMO the correct thing is to have QEMU use a qemu,plicX rather than to
> > weaken the requirement that a non-generic compatible be used. Otherwise
> > you end up with QEMU using something that's marked as deprecated and
> > either the warning remains and annoys people still or it becomes too
> > weak and people ignore it when creating real hardware.
> 
> It's already in a driver so I figure it should be in the bindings too.
> 
> In arm's virt.c they use the generic gic compatible & I don't see any
> evidence of other archs using "qemu,foo" bindings. I suppose there's
> always the option of just removing the "riscv,plic0" from the riscv's
> virt.c

I think we're pretty much stuck with what's in use already.

I'm on the fence whether to mark it deprecated though if there is no 
plan to 'fix' it. Doesn't really matter until the tools can selectively 
remove deprecated properties from validation.

> >> The final patch adds some new ISA strings
> >> which needs scruitiny from someone with more knowledge about what ISA
> >> extension strings should be reported in a dt than I have.
> > 
> > Listing every possible ISA string supported by the Linux kernel really
> > is not going to scale...

How does the kernel scale? (No need to answer)

> Yeah, totally correct there. Case for adding a regex I suppose, but I
> am not sure how to go about handling the multi-letter extensions or
> if parsing them is required from a binding compliance point of view.
> Hoping for some input from Palmer really.

Yeah, looks like a regex pattern is needed.

Rob


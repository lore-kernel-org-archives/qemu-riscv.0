Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4UFS-0006br-QH
	for mharc-qemu-riscv@gnu.org; Thu, 14 Mar 2019 13:34:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1h4UFP-0006Zr-Vr
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 13:34:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1h4UFO-0004Z0-6a
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 13:34:27 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:35408)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1h4UFN-0004XA-4G
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 13:34:25 -0400
Received: by mail-wr1-f46.google.com with SMTP id w1so796524wrp.2
	for <qemu-riscv@nongnu.org>; Thu, 14 Mar 2019 10:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uhK6w2xztMgZQSOmYUqAB3/hEVNKz/8xvguAgWbpmXg=;
	b=qC+Nv1/ujWN3W/kdLiE7MyRIHTgBXvUfRLUiZoAE+uXS4Ub75nsSRijzZxQ/cM2g4h
	HqjU44azgb9MAFkezGbs3eh0018GaSo12YK04K6lqmqvxCffP4VTmkJZFdYT0EShWJPL
	a3tinzsa65kQZc6HGD0LGDwU3fq3O817OrDmPRx9DTYyh6JfVkDpOa0Lb5WF8OlyTsDc
	f5b3KonAqIvQO2d8GTNu4XqC3NBMf9wywssKQKBG9APa6zaATTOqiagIfZc85rFQdQlM
	d2DypHIeuAuPrdZX8VrmOaAyORdw5YTnpfi2661kqzWz1agk2G/BWUXZlM3Jqgz4bCLH
	h3CA==
X-Gm-Message-State: APjAAAVzhkCf98F+3GgAuQa4GstohWSYbDeYsJqop9Vu1PrQ6H+T9wxA
	koPzlu08wqatelsQ++bo7amhvQ==
X-Google-Smtp-Source: APXvYqzWd9ZpQfzjzjG45G6G7Z6l+07krAVsq6vCB0rzaACg7bFn4Yuowfy9qLlsGxxpCyRNYXenVQ==
X-Received: by 2002:a5d:4110:: with SMTP id l16mr13179213wrp.129.1552584861952;
	Thu, 14 Mar 2019 10:34:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3ca4:614c:6e99:b981?
	([2001:b07:6468:f312:3ca4:614c:6e99:b981])
	by smtp.gmail.com with ESMTPSA id o8sm3818944wma.1.2019.03.14.10.34.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Mar 2019 10:34:21 -0700 (PDT)
To: David Abdurachmanov <david.abdurachmanov@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, thuth@redhat.com,
	qemu-riscv@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Andrea Bolognani <abologna@redhat.com>, 
	qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>
References: <1551723614-1823-1-git-send-email-pbonzini@redhat.com>
	<1551723614-1823-16-git-send-email-pbonzini@redhat.com>
	<100bab7e060234ff76a1fe7d0d97bc79368a2a4e.camel@redhat.com>
	<20190314085921-mutt-send-email-mst@kernel.org>
	<CAEn-LTrgapxSbiYK2MoBxg5q2mc9i2gDMpcp451NDY2ob7-c3g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <105a7417-2f7d-22aa-1f65-a6ff94706d3e@redhat.com>
Date: Thu, 14 Mar 2019 18:34:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAEn-LTrgapxSbiYK2MoBxg5q2mc9i2gDMpcp451NDY2ob7-c3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.46
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 15/54] build: convert pci.mak
 to Kconfig
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2019 17:34:29 -0000

On 14/03/19 14:03, David Abdurachmanov wrote:
> Would it be enough to modify ./default-configs/riscv32-softmmu.mak by
> adding:
> 
> CONFIG_PCIE_PORT=n

The missing dependency is for any board that doesn't support MSI, not
just RISC-V.

Note that technically what we do with msi_nonbroken makes no sense from
the PCI point of view.  An "MSI" is just a memory write so there is no
such thing as a device that doesn't work because the board doesn't
support MSI; it should be up to the OS not to configure MSI unless it
knows the interrupt controller can be set up as a destination for MSIs.
 The driver in the OS then can choose to use level-triggered interrupts
(INTX) instead, or it can refuse to load.  At least, this is how QEMU
*should* work.

However, we started doing this msi_nonbroken thing, and therefore, since
we can model it correctly with Kconfig and obtain the same results as
pre-Kconfig, it's a better way to do it.

Paolo


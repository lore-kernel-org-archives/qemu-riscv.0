Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86303C5B543
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 May 2025 11:36:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKy1h-0004Yv-4d; Fri, 30 May 2025 07:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uKy1f-0004YS-EL
 for qemu-riscv@nongnu.org; Fri, 30 May 2025 07:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uKy1c-0001kK-Ie
 for qemu-riscv@nongnu.org; Fri, 30 May 2025 07:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748604946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmjtuBgro1iLL+lQ7PfSG+YZIWnOMKtg8axX21EwLnc=;
 b=IKPLte22/jDaZTNU80JviScGwXA7JRhQBJNl+N2uiPmgrUBrsGYQRLJDk8y4ZRAUv4WTcv
 gvHoTKo+ij/BS0akmEoKE0tI1MjiiLZ3Be/eTyJjClQ+sTdF5nCioGQSLL6lCnkqLDmjpA
 R7Mi7AGkzGjG9XzHgn5WW4qrDzgHS+o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-Y2dOezUDPMSDGm1Cl0SwOA-1; Fri, 30 May 2025 07:35:44 -0400
X-MC-Unique: Y2dOezUDPMSDGm1Cl0SwOA-1
X-Mimecast-MFC-AGG-ID: Y2dOezUDPMSDGm1Cl0SwOA_1748604944
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450d8cee684so2416135e9.1
 for <qemu-riscv@nongnu.org>; Fri, 30 May 2025 04:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748604944; x=1749209744;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SmjtuBgro1iLL+lQ7PfSG+YZIWnOMKtg8axX21EwLnc=;
 b=JS3Ek+CtqiyXBIc9dKaszvTp29Hcz1pDyl3bw/rdRkE9zj37Fl0jYCGL4rgDTQHmp6
 MZtvSjkfAcs5rAomfP0qjPOpddIaLOcGXJPoNrb0sadgmhGRj6L1iVTk8giJxuIM/fKw
 /CPpfUMYXbWkMJnjEuC5VKVisIRtQ8DnBAoVp13E5BrBJ6lbCp2KXgJVd6T90yuDe8+w
 9pzZxkdTjB+s+rq4y1KXDtUsjKGWZsACoTiP5ndon2qKBWC/yZ5lTVh3fMfYvv/j1BrZ
 Ik3z7AReKOjtbk3D3ibAr1lIRErHaO83ZICChq/KAtvkbReOGM6EwpCZBJ9zzzZwagpL
 dzRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwQvAUV3sQg0ecNv86K62nWTxifEcAFzZZl1B+Gzb9bnRc58SnCCPQ8oLrQ215PkSi1e+nBJyXBkw3@nongnu.org
X-Gm-Message-State: AOJu0Yw7QasDmZP7T/A76vo5EMY4lLMAQdsgD9Fx2hjYYmkeub4CKt4G
 Ytb24bGa8dcEkWvO7Iarm92I5i3BDX8vTlWFrwE5D2FQyO/sVv8p1QgABqgxE/rJYpm8sEmVXtE
 7ViLQYkxTNdqHnjhr1XTUT4w0sY7gBus50HCQA//HeqRTAOnmnayyypN/
X-Gm-Gg: ASbGncu5rc8FAufwLT0oAXNXQfjUo5030WwgZHL9FIGKobxtKHyZ9r/RaHyG0nwEWen
 R+NibkXmDzzJXhpa9z7sCr7wB1W2OVujob8FpcEXmHIV2Z7uRxbimOwZtyGK/QKDQNrcZczER9H
 TgyWLG7U0n3iYBu65n6UP1irhEPMbXS61jUwKQ5Ywssqs7E7lUUYMLT2KvJaOpvJicaMFoamzYZ
 q0yhFS9AfBjNGjqvgjhm8Mxha5kjW19Lr4GnL2W6VxQRcZexxLxfw1hm/ZMzM0/vmsvrjWI/YLd
 tNdOJg==
X-Received: by 2002:a05:600c:4fc3:b0:43d:174:2668 with SMTP id
 5b1f17b1804b1-450ce684b14mr56797005e9.0.1748604943694; 
 Fri, 30 May 2025 04:35:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVAiHCays6owmIaqzT9s1ZDbqz8dccPcgBZRtaLkp6VX/ZpZKxJ2dWzQChS1U7mqSqt3zPTA==
X-Received: by 2002:a05:600c:4fc3:b0:43d:174:2668 with SMTP id
 5b1f17b1804b1-450ce684b14mr56796445e9.0.1748604943253; 
 Fri, 30 May 2025 04:35:43 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fc1b60sm15903185e9.34.2025.05.30.04.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 04:35:42 -0700 (PDT)
Date: Fri, 30 May 2025 07:35:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?iso-8859-1?Q?Cl=E9ment?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org
Subject: Re: [PATCH v4 00/27] hw/i386/pc: Remove deprecated 2.6 and 2.7 PC
 machines
Message-ID: <20250530073524-mutt-send-email-mst@kernel.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250513132338.4089736b@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250513132338.4089736b@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R890VR2xkI6RGZBf6BXCGV2rCkoVI1xwfWIY-Ob4J5g_1748604944
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, May 13, 2025 at 01:23:38PM +0200, Igor Mammedov wrote:
> On Thu,  8 May 2025 15:35:23 +0200
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
> > Since v3:
> > - Addressed Thomas and Zhao review comments
> > - Rename fw_cfg_init_mem_[no]dma() helpers
> > - Remove unused CPU properties
> > - Remove {multi,linux}boot.bin
> > - Added R-b tags
> > 
> > Since v2:
> > - Addressed Mark review comments and added his R-b tags
> > 
> > The versioned 'pc' and 'q35' machines up to 2.12 been marked
> > as deprecated two releases ago, and are older than 6 years,
> > so according to our support policy we can remove them.
> > 
> > This series only includes the 2.6 and 2.7 machines removal,
> > as it is a big enough number of LoC removed. Rest will
> > follow.
> 
> CCing libvirt folks
> 
> series removes some properties that has been used as compat
> knobs with 2.6/2.7 machine types that are being removed.
> 
> However libvirt might still use them,
> please check if being removed properties are safe to remove
> as is | should be deprecated 1st | should be left alone
> from an immediate user perspective.

Anyone on libvirt side can confirm please?

> > 
> > Based-on: <20250506143905.4961-1-philmd@linaro.org>
> > 
> [...]



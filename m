Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3F7CCF9FE
	for <qemu-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 14:24:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vEq31-0006MC-AB; Fri, 31 Oct 2025 10:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vEq30-0006M1-5Z
 for qemu-riscv@nongnu.org; Fri, 31 Oct 2025 10:24:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vEq2t-00073n-1W
 for qemu-riscv@nongnu.org; Fri, 31 Oct 2025 10:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761920634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8NsndKxi9wjfiwiNCzQ0sDwvjij+/0YwRPZVMGXiAQ=;
 b=CDzHUCDQOViS3D8LLnruRk5FzzHkB5EBPMZwGO+r8xzucVW4pyKjnwvEnAJkqeBt4ePHcc
 EQn0BHCey28sWr4BhFrCKvxJDIlK2D/VOt3eXrErbrDdnyt+6eDH5In5SeZ61d/54w4dZ5
 396WAiax4msxCBeGiQxuJQ/0oA72hCw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-8OwbC5Y6OVKcC0rbFW5wAQ-1; Fri, 31 Oct 2025 10:23:51 -0400
X-MC-Unique: 8OwbC5Y6OVKcC0rbFW5wAQ-1
X-Mimecast-MFC-AGG-ID: 8OwbC5Y6OVKcC0rbFW5wAQ_1761920630
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-475de0566adso18409585e9.0
 for <qemu-riscv@nongnu.org>; Fri, 31 Oct 2025 07:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761920630; x=1762525430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z8NsndKxi9wjfiwiNCzQ0sDwvjij+/0YwRPZVMGXiAQ=;
 b=AitgMdtc9yGF1lD8svb5nQWObsDNW4g7/wXRJN8Ga8ERpuemGJkYI1ania4z+pG1w8
 Gh/FwWdl6Ch78d4XxIDKbuoaEOE8oCC+HBEfd2dRANDO8pYR1u+2BjC3534BqYc7Olq2
 w1poO/8CmQ+K1YGUE9glmnl54xz/sF1p1hr0yJHR1Q/DNBStxUb432u1HvqD3HxYoJ/9
 BYH0uvMzjbHKfoUl3zmi/3UlEXwhIb2GbMcXG7Tp9TxZuqUiqo6fqaYCZsKSSNQzXMHZ
 f6rnbOpPHEw2sUGoYEVgcik0xRoiUpdTCN/TO+UlpnoEHbKi+c6avZmAU3luihv9HMUW
 DBzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWB31KoN2Qcr1fP1Ij/iidmXFax9H4RggkaLyXR+r1CI+4t59DGncFKitqNsJRWvbL+LAFlc+lccCX@nongnu.org
X-Gm-Message-State: AOJu0YyRS73jWtli/vSohVLZE+pm82HJ8taidCl46s4Saz1aTWnXjgKn
 L8dP6nj7bQ0eNLnDt8oVPlDUcuJeD7tZP9na+BOH1iNmya9JO8QA+zj22C9QXzp1jn32zD81Nl6
 NqkcZFPs0qlJrHUpzuH0B4Oq8UK2cGAblrHgsb5HQ3dwWo+Pd0vphNhAe
X-Gm-Gg: ASbGnct/5SSEoXlSyP2+5AnJX0Ga9u8MsvjlUejM5WHk9CcOlZqzzj4toUo/TzCqUKc
 8NJfVun0nLQS2P/EHhKZtTZ50AQGxd9sLelQVaampxmP2APkwHcGjGI+u8O9I4rqcZdm+9l/zyk
 ZTD6Ff1gX18Q9EB/S2t8yVBYNm0cr7voARYlalw4jZikSHKRssP1FBaMioMhQ4NLrQO4IbHam+2
 Q21VRDPH82YHm2GKQ8rbxnLrKl/977K9pfG3//Ju0kW2Dn0b1oZcwcWQSkT6bSD0XtBpjajJO38
 ElZbh/tZMOvNBEJ3fKVhDRrJhmxhhOD+5inql1sSHpTZ6maqaoIdrYpQvNyGAngB5A==
X-Received: by 2002:a05:600c:c16a:b0:46f:b42e:e39e with SMTP id
 5b1f17b1804b1-477308c60aamr38306915e9.39.1761920629809; 
 Fri, 31 Oct 2025 07:23:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH73DZHEsR+mQzo+LpxpAHYqi6uaGXmBv0wFmteO6GGOwU3gZyA1bUah7DEckHfOtZkUbifcg==
X-Received: by 2002:a05:600c:c16a:b0:46f:b42e:e39e with SMTP id
 5b1f17b1804b1-477308c60aamr38306415e9.39.1761920629398; 
 Fri, 31 Oct 2025 07:23:49 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c2ed409sm664775e9.2.2025.10.31.07.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 07:23:48 -0700 (PDT)
Date: Fri, 31 Oct 2025 15:23:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Yanan Wang
 <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, Ani Sinha <anisinha@redhat.com>, Fabiano Rosas
 <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif
 <clement.mathieu--drif@eviden.com>, qemu-arm@nongnu.org, =?UTF-8?B?TWFy?=
 =?UTF-8?B?Yy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 00/27] hw/i386/pc: Remove deprecated 2.6 and 2.7 PC
 machines
Message-ID: <20251031152345.65b2caed@fedora>
In-Reply-To: <aQTEKyQjqIIGtyP0@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20251031113344.7cb11540@imammedo-mac>
 <0942717b-214f-4e08-9e2a-6b87ded991c9@linaro.org>
 <aQTEKyQjqIIGtyP0@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LBrQZCyNESicnImcyDgLbe6Jh-Hkfx8OF9g_6IaBD2s_1761920630
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 31 Oct 2025 22:14:03 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Hi Igor and Philippe,
>=20
> > On 31/10/25 11:33, Igor Mammedov wrote: =20
> > > On Thu,  8 May 2025 15:35:23 +0200
> > > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> > >=20
> > > Are you planning to resping it?
> > > (if yes, I can provide you with a fixed 2/27 patch that removes all l=
egacy cpu hp leftovers) =20
> >=20
> > Sorry, no, I already burned all the x86 credits I had for 2025 :S =20
>=20
> Don't say that, thanks for your efforts! :-)
>=20
> > Zhao kindly offered to help with respin :) =20
>=20
> I haven't forgotten about this. I also plan to help it move forward
> in the coming weeks.

in this case, I'll send reworked patch (not really tested)
as a reply 2/27 so you could incorporate it on respin.

=20
> Thanks,
> Zhao
>=20



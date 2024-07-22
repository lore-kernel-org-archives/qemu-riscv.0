Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E606EC3DA59
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 07:50:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sVnnR-0000Fj-N7; Mon, 22 Jul 2024 03:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sVnnP-0000CM-TY
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 03:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sVnnO-00072q-Fk
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 03:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721634560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDLhW/EvsV4foDiw7atelQzE6sEnxMcaTf6f1U6EU8Q=;
 b=eKfJvgrCtjJ6HTiz4gQTKItyz1PxH6+J1fwCYh21LrhJKtQRDVZ7awODfwTGm0RgJQGs19
 JmsgTgSh1E/gIvpCoprF/7nsXduKG2fyQxiDYE3emQtJUVPIbNSXmk5upzRyjzrj6ItMAp
 ySQyDVapq0EvNYRyZ0pNfeTwYt/bZmA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-hqMAGsVMPi2RqkI1vmqvBA-1; Mon, 22 Jul 2024 03:49:17 -0400
X-MC-Unique: hqMAGsVMPi2RqkI1vmqvBA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3687529b63fso2278353f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jul 2024 00:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721634556; x=1722239356;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nDLhW/EvsV4foDiw7atelQzE6sEnxMcaTf6f1U6EU8Q=;
 b=MbO8U4B5QaG9th0e3mWZvHOqi2Z8xmb+55LHEa3qjHhFmJiZvevm3vUvpbs+yb31s8
 xMh/IiYAwZGI944Url4dUg2QmSxziREHs734OpI0kvaTl7hz9lYuDhSGKhDOlkNQzau7
 /1NqnqjbUQW3H8iaAA8EXTDRwjt/zJuCi/0o9fNG6C0PYAUgQqRHWd6EC2O8PJMrs7tI
 prdievpL5Qx5QXYXciKJC4T3WRa79gqNWnNp7k4xK7V/syk60bTLLxIp7odr56oYk7As
 H9hcl1gjl6ETt/hn1OOGHI3fjDpg8VKE2yjaXplAcCFeycpDJGhx6Zas5EcilgCDUNUG
 CBxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQaTzTEYjtdxjW/SPYUqLMhGxeLuZrmUzR3COWYO6R88drHiKF7axoY9Fnz74LePwM/v2Q3vco70qF6FjAHk5D5VQAhoE=
X-Gm-Message-State: AOJu0YxIISEscxbjHllJhbI3GxWYeJyicLQiL02yLv8+Z9GLm/JbdyYF
 WRqlZKVmN4RSkIAhkduKr4Wum71lZZCsLQGQGR8sK1O17tQwzEbfr/Db+L/Ox8jPtaxb3synDfW
 Ht0cGeqQtn3DL2aDYIfeDUAPzrpqieVkPSgZDBLPq5hleVmsPYWEy
X-Received: by 2002:a5d:6592:0:b0:368:334d:aad4 with SMTP id
 ffacd0b85a97d-369bbbb3200mr3493385f8f.4.1721634556284; 
 Mon, 22 Jul 2024 00:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQpkb+l1/5zh9gSQJ8TazoT1/1nNlG0GIr0WTsIP23uDq0RjdA30Tjl5jp4P4w6UNcmOh2ww==
X-Received: by 2002:a5d:6592:0:b0:368:334d:aad4 with SMTP id
 ffacd0b85a97d-369bbbb3200mr3493366f8f.4.1721634555570; 
 Mon, 22 Jul 2024 00:49:15 -0700 (PDT)
Received: from redhat.com (mob-5-90-115-88.net.vodafone.it. [5.90.115.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ced56sm7758092f8f.80.2024.07.22.00.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 00:49:14 -0700 (PDT)
Date: Mon, 22 Jul 2024 03:49:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 0/8] Introduce SMP Cache Topology
Message-ID: <20240722034820-mutt-send-email-mst@kernel.org>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <Zp4LUSXlwXqI880x@intel.com>
MIME-Version: 1.0
In-Reply-To: <Zp4LUSXlwXqI880x@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Mon, Jul 22, 2024 at 03:33:37PM +0800, Zhao Liu wrote:
> Hi Daniel and Markus,
> 
> A gentle ping. Would you kindly have a look at this version of the API
> design? If it could meet your satisfaction, I’ll continue iterating.
> 
> Thanks,
> Zhao


I'm not really a QMP guy, you want Markus.

-- 
MST



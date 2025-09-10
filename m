Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF4DCA0FED
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 15:39:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uwMt4-0001O4-9d; Wed, 10 Sep 2025 11:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1uwMt0-0001Mm-Mw
 for qemu-riscv@nongnu.org; Wed, 10 Sep 2025 11:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1uwMsy-0000mX-Ar
 for qemu-riscv@nongnu.org; Wed, 10 Sep 2025 11:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757518645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kz9SnuI3/vpVZX5JTY6tsF5sQkS6K7Yu30w0y6EtaSE=;
 b=fvLL7s6p3B62R3t4/NUmbqIxGXHKTDb6LK6cDn6VpyTegJWzLJ2mTpqSrKoFaQUKU6PfwZ
 DHy0A8JkSEspNNoBp+T1HMbCoZQATp+D+LQzsOSjxuPyMNBR38pHrg/AUYtl8yEffV1jt1
 HBnAHJ4vNP1PAtkrNTxoh2xkTZq1PWg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-PurBP5UUP6ywauzyv21k4g-1; Wed, 10 Sep 2025 11:37:24 -0400
X-MC-Unique: PurBP5UUP6ywauzyv21k4g-1
X-Mimecast-MFC-AGG-ID: PurBP5UUP6ywauzyv21k4g_1757518644
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8080713fa17so1462598585a.2
 for <qemu-riscv@nongnu.org>; Wed, 10 Sep 2025 08:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757518644; x=1758123444;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kz9SnuI3/vpVZX5JTY6tsF5sQkS6K7Yu30w0y6EtaSE=;
 b=kANkLKAsNy5o7d6+CdXBIiOfFUBAymPRxre1/CmJkJbm/oE2TfjOrKJwJ9+LrpTW+M
 NXohiGtr9g+b3/MQQmiXz3Uc5nmOSaNkDYYfM3X2+oCs3burhR1K7RMPQSOhnFOWTzdA
 6Es+1jlX67ekrNPOTNaQ2vAw7UMdiZ2M+twk8BOFI3a6nQXX1Q2ssBRdsJJn7BHtGTFJ
 Tflijzp4ywrwOztwnhOyr8/Ad74rkZW3l6Svk2l/qL6z8grii+M0urTobAxGCSE4botF
 qUj0NdH1dSeANHDx1J/kgYbQyRGycVBjr2hzv4jG0YNSdpbdgyA7YrqM0U7rNKPvuSom
 eusg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbX9Dtx7zmEiimeGOu799E4wWqaVCkf2IE2SMI6Tph1J/GZsUnJNiKM8zKSLokN1aSq3d9KGdZkc3p@nongnu.org
X-Gm-Message-State: AOJu0Yx0RXEto5/u6vRYvgMs6CRM94AMW7/hiXyUu5faKAegnZpYW6mm
 v6XRvTuUOc1CBNOrHkEDQ7GzDxov24LyAman+OsVvl0USYTDEvIOB9qIPuOYalZujnFR0KbRlZi
 O8xJCAZCfE8s9xM6FEAH+kqJ+Ti7hk9t7ZtT2hgY82mwqRwHEhHhrzI56
X-Gm-Gg: ASbGncvBUZuRl5TVy0IILkIsI17DRdGR8SsuvuESdnb/1gEjsH7pIhTMWJzB6s1oXJ/
 bQYH2qvXXzj3xuFgdbPnTgHxkHll1OkCmYxIY9pYBbhwTjPv86GzpIOvQTIoH4mNz9e05qgIGlA
 xwogyFUOPoLkVLDlQxqEtMTx6TGzp3z1rYwqYBG1wqifRBWtKsej8NFEZyapF4rruD6EFeIft67
 bdghM0oH/NWHetOdQabEI85eDv8LTR4Z0b9wcYcomL+uEdDTinrAcLOIUhh5MPQrlme3kiVYZvR
 jZsrjIzHy77J8O+3/32BiIU6mbNkp0x0
X-Received: by 2002:a05:620a:2795:b0:813:f407:b231 with SMTP id
 af79cd13be357-813f407b2c1mr1353189385a.7.1757518643591; 
 Wed, 10 Sep 2025 08:37:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf/KuVdeKLvj4EGYJry2HAEzT1NBiK0ZFDkaqiHiRRXlDFFH/PmMK8tC1foIGn96Mz68XKwA==
X-Received: by 2002:a05:620a:2795:b0:813:f407:b231 with SMTP id
 af79cd13be357-813f407b2c1mr1353183785a.7.1757518642801; 
 Wed, 10 Sep 2025 08:37:22 -0700 (PDT)
Received: from x1.local ([174.89.135.121]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b61bbbc0ecsm25838081cf.25.2025.09.10.08.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 08:37:22 -0700 (PDT)
Date: Wed, 10 Sep 2025 11:37:10 -0400
From: Peter Xu <peterx@redhat.com>
To: TANG Tiancheng <lyndra@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH v2 2/4] include/migration: Add support for a
 variable-length array of UINT32 pointers
Message-ID: <aMGbJusVNgQ-N7y3@x1.local>
References: <20250910-timers-v2-0-31359f1f6ee8@linux.alibaba.com>
 <20250910-timers-v2-2-31359f1f6ee8@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20250910-timers-v2-2-31359f1f6ee8@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w7grEqHz_9pHJcbf8sKINWkab78s8k_RUZVgWJeClNI_1757518644
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On Wed, Sep 10, 2025 at 11:04:26PM +0800, TANG Tiancheng wrote:
> Add support for defining a vmstate field which is a variable-length array
> of pointers, and use this to define a VMSTATE_TIMER_PTR_VARRAY() which allows
> a variable-length array of QEMUTimer* to be used by devices.
> 
> Message-id: 20250909-timers-v1-0-7ee18a9d8f4b@linux.alibaba.com
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>

Thanks.

No need for a repost, but the subject can be prefixed directly with
"migration", if can be fixed when merge.

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu



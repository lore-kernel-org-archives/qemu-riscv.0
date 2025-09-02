Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4173ACA1005
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 16:10:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utTZv-0003Tt-MT; Tue, 02 Sep 2025 12:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1utTZt-0003Sw-Gd
 for qemu-riscv@nongnu.org; Tue, 02 Sep 2025 12:09:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1utTZo-0003W5-T9
 for qemu-riscv@nongnu.org; Tue, 02 Sep 2025 12:09:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756829383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpcHDAAyOTYM3eawixZKhDYVLH1RxWSoq6LduiFlQRw=;
 b=aF+RDKF3Rx6UGrzbZnAwG1O/1s1FIuOJZuV+PK/ULdnlMo40gC6lvalSUOXwyF5SPoZeNT
 WXmEkNA8n/v+3KdslIhxor/A5bQ8bH7Nk+eSUsRLE4/Fo/tJ7l0Y3A6VSAN5S8LG9Nu4XO
 BsVEqm5DP+yD3GbHzYeqh3kjYj/ZCng=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-L8dLYXCMPdq4f3sPYE2eEA-1; Tue, 02 Sep 2025 12:09:40 -0400
X-MC-Unique: L8dLYXCMPdq4f3sPYE2eEA-1
X-Mimecast-MFC-AGG-ID: L8dLYXCMPdq4f3sPYE2eEA_1756829380
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70edbfb260fso68964556d6.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Sep 2025 09:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756829379; x=1757434179;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UpcHDAAyOTYM3eawixZKhDYVLH1RxWSoq6LduiFlQRw=;
 b=QzIHXYDAzdRjjaZVR0+foPPeBls7BMYW0oduVeJrWB1FZSVtgpm/gHzf0fKCUBdSwy
 BZzSoON7jTBnjiQ5JzZXv9x7B+KEbQtUwhbG90AzJMKUbXBLKsQd3U4opD2sb7zl0/TY
 LvGOFz3mQWIU+i+v5vflZFYVZJupwdv5c05//e//ZQM0O3dViX6HSrZ4cNmjSYdPmAcO
 7zzPpWGweRxYEzZ5MBZdCZmfJT/ZBgnDnunOjsLRhYvxEWK6KDpTlvj9b6opqFkApXIW
 ouMctSk23zAt61OUvit3F5n1NhonAXpIjpUQj1DIIB7cB0O3hMdjegGzqI/JZUPplvZV
 Ir2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUBxpJPsXg3L0wXp3oJDLldZwxg5HvQbrX8mvrMG4sTMMkTjhUkwG27/cM3K5Asr8g8SeBsmOIguvX@nongnu.org
X-Gm-Message-State: AOJu0YwEql5V+MDFUgf8mBu+YoPt9X6D3K8uVDJ88Yy38LFMO3oisDNc
 hmTu53heKBkS9W2ZzKjx0Xqa630pTeKoedpZWtGTBo8rx479zP7/mNRnD6dL+p5PGWAbWcDZCWg
 9AjN+qBazzzwSlq0Ag+S3n154lXjhkV4uvRv/lCbOq2M+nFQB8xS0YRIW
X-Gm-Gg: ASbGncuuIt//AKcTnN1+dFdn02aA3M8oiixUkMPwoxnDN/w0paMh/J4voVy37sjU//U
 K2LE8FLKFW5E1E0PsMqbhfLEuRxYm0leZNvoti7U+MNyhGzhCpho2zztTsNV5wyUFgfYS7yKnSp
 RkxsThLhViL27twSxOa4F/1yT0cBTylam5/9DXVxjWb5iVqpU4qUx2G7x3JBMdZZxsFqZT9XNiX
 2R5ZuPT5h07B5x+Ij3BGDpGEzRaxrWEQ0h+JRHw9dtkB6op76o5xS3liiDRq/wM9hemaFdsTH7O
 1vDV06QO5D2XLl28ruQb8pKMfFsuXO8v5ukT6eX8yydXMgsk7WUb23HP9BkHOQPVVEnYD09TDf6
 oHKGfId6FOkuk9RSz5FMOfA==
X-Received: by 2002:ad4:5bea:0:b0:719:8c9:ac46 with SMTP id
 6a1803df08f44-71908c9b053mr84640106d6.31.1756829379311; 
 Tue, 02 Sep 2025 09:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFA+o8MtdVn6jh8uqZQg4EkE9j0wQjPLs6EY5RaKa/Upm95l8mvxsJO1EplXbmIuVokSj4Lg==
X-Received: by 2002:ad4:5bea:0:b0:719:8c9:ac46 with SMTP id
 6a1803df08f44-71908c9b053mr84639366d6.31.1756829378573; 
 Tue, 02 Sep 2025 09:09:38 -0700 (PDT)
Received: from x1.local
 (bras-base-aurron9134w-grc-11-174-89-135-121.dsl.bell.ca. [174.89.135.121])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-720b4947b1asm13911186d6.41.2025.09.02.09.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 09:09:37 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:09:33 -0400
From: Peter Xu <peterx@redhat.com>
To: CJ Chen <cjchen@igel.co.jp>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jesper Devantier <foss@defmacro.it>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 1/9] doc/devel/memory.rst: additional explanation
 for unaligned access
Message-ID: <aLcWvR5Snm1RXEcY@x1.local>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <20250822092410.25833-2-cjchen@igel.co.jp>
MIME-Version: 1.0
In-Reply-To: <20250822092410.25833-2-cjchen@igel.co.jp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AV34HOBVM7leh60NFgfO7dCwIHYw3WlMxIxLXZQ-2qM_1756829380
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Aug 22, 2025 at 06:24:02PM +0900, CJ Chen wrote:
> Add documentation to clarify that if `.valid.unaligned = true` but
> `.impl.unaligned = false`, QEMU’s memory core will automatically split
> unaligned guest accesses into multiple aligned accesses. This helps
> devices avoid implementing their own unaligned logic, but can be
> problematic for devices with side-effect-heavy registers. Also note
> that setting `.valid.unaligned = false` together with
> `.impl.unaligned = true` is invalid, as it contradicts itself and
> will trigger an assertion.
> 
> Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/devel/memory.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
> index 57fb2aec76..71d7de7ae5 100644
> --- a/docs/devel/memory.rst
> +++ b/docs/devel/memory.rst
> @@ -365,6 +365,24 @@ callbacks are called:
>  - .impl.unaligned specifies that the *implementation* supports unaligned
>    accesses; if false, unaligned accesses will be emulated by two aligned
>    accesses.
> +- Additionally, if .valid.unaligned = true but .impl.unaligned = false, the
> +  memory core will emulate each unaligned guest access by splitting it into
> +  multiple aligned sub-accesses. This ensures that devices which only handle
> +  aligned requests do not need to implement unaligned logic themselves. For
> +  example, see xhci_cap_ops in hw/usb/hcd-xhci.c: it sets  .valid.unaligned
> +  = true so guests can do unaligned reads on the xHCI Capability Registers,
> +  while keeping .impl.unaligned = false to rely on the core splitting logic.
> +  However, if a device’s registers have side effects on read or write, this
> +  extra splitting can introduce undesired behavior. Specifically, for devices
> +  whose registers trigger state changes on each read/write, splitting an access
> +  can lead to reading or writing bytes beyond the originally requested subrange
> +  thereby triggering repeated or otherwise unintended register side effects.
> +  In such cases, one should set .valid.unaligned = false to reject unaligned
> +  accesses entirely.
> +- Conversely, if .valid.unaligned = false but .impl.unaligned = true,
> +  that setting is considered invalid; it claims unaligned access is allowed
> +  by the implementation yet disallowed for the device. QEMU enforces this with
> +  an assertion to prevent contradictory usage.

Some cosmetic comments only..

This shouldn't be another bullet, but rather a separate sub-section,
because it describes the relationship of above two entries.

IMO it can be better like this:

MMIO Operations
---------------

...

- .valid.min_access_size, .valid.max_access_size...

- .valid.unaligned...  See :ref:`unaligned-mmio-accesses` for details.

- .impl.min_access_size, .impl.max_access_size...

- .impl.unaligned...  See :ref:`unaligned-mmio-accesses` for details.

.. _unaligned-mmio-accesses:

Unaligned MMIO Accesses
~~~~~~~~~~~~~~~~~~~~~~~

...

-- 
Peter Xu



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4F1CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:42:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoda-00057h-EF; Tue, 28 Oct 2025 14:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vDodV-0004zP-Le
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:41:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vDodI-0005mb-K9
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761676876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LbdFtFheFozDA/Dq4cgI2dg6cbI5rnjMpYsY6r4xZ7A=;
 b=CghR5X4n13DpNHcZDs0K+/06VL9xkMl03dAlCT3zO+SoYSHU4ITQuefPzCwBBPIepfSCWT
 EXIjWMFpBKKD5h3PZtloOEiISM23ukzblC5+IyNUqi86XdEUVIYWm6ykdukAfOnuiaseyY
 bE100P0odCgWIrGaZwNqDljinD2TH5g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-P2gZmy76MKW2Ie4oixDA8w-1; Tue, 28 Oct 2025 14:41:14 -0400
X-MC-Unique: P2gZmy76MKW2Ie4oixDA8w-1
X-Mimecast-MFC-AGG-ID: P2gZmy76MKW2Ie4oixDA8w_1761676874
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-88fec61f826so1695544985a.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676874; x=1762281674;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LbdFtFheFozDA/Dq4cgI2dg6cbI5rnjMpYsY6r4xZ7A=;
 b=LPfz80umetFjDypkdlMy+0rV0jcHppwexnBPnMHVJhZZeOZppZUTdgQHVQRzdom+Um
 um71DW5r66NJVVp6fps/k89KZWoMyX+jAznbdm9mZiPZoYfWO/mcCQAm8ahelQcmKGaB
 EfDnYDVEBA/j3o/OttEP6/eQIYUPvYg//CRLPbyVDAX9yPXqRiRg8vJDrso+POai60wg
 Pa7pHCQbiTjeJm7BiDH9kx2C2xfFvHsQtbSZaCs2bHVJFXo4tMUS/CVgYFwrGCtV4lZS
 5JOF/OcZS00cKjZA6vLL5m4hqDLzdEnEMVPJCF7x1GM8r498HvCR/4qbPJ9CGVmvJ9nC
 bKOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmH8hhIbJGd63m+V2y2EwBugb9OpilgC9sNlBN709Cuyit3EKlsxnrLCo2ZMjdXbo/rvyEkemFdeO0@nongnu.org
X-Gm-Message-State: AOJu0YySOAk68gxn1fRftSCs2UExjBqP8EIiLyRo6fS3G/Cw6xVoh0FS
 c2rYduC0Jcx3ifQEDaySGG7MsVSkjahO3WwBLtu6amQoJYFQgLAcHkPiaz+aSONtjS2ISPqgvKt
 2iM5geLhlgjHdtjnp5b9BVvcfSiBQuXfXraIOZgdb5RxrkqfMCNo+9jXC
X-Gm-Gg: ASbGnctkdjbsgexNEiUTAW4akRBZvnkZEYcn3LbSrVJ9akP9ARp2Ujp97gTVWhEQbn9
 Twt+UzHhmjFeoCzfaXOL30WcsHevEUTt+nA6r73Rbt/sGJ3sksbI1Qrc+j4GdKAOab8ggA9/F9q
 XyKUxn3zHIlDd56J41cAAj0J3LAl40h8MnIrN4OiWDmTMiAnvIU4cRDpOLujn9RgJ339ml2Bx6G
 SM9cxDeShxzc367plKvtv4YLIA48Y7RuLQXT0AqtDvgyWWStFto2IBudjnP6SnrJ5g6FQf8i8S7
 hwAQsqNS7b7Gkm7BBEJ6bOaekCfcet4p3oVo7tE39G7FShPOdCiWdU9PUnHxgCHbmo8=
X-Received: by 2002:a05:620a:4512:b0:89a:2f2d:f951 with SMTP id
 af79cd13be357-8a8e6954ac0mr49383685a.64.1761676873662; 
 Tue, 28 Oct 2025 11:41:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExlGj2eHAfl7Q0UihMJQXKFKYGcAui8Hur/E8eN5n88UQ5+B369cHASvyD7Eab3tZKhyEqag==
X-Received: by 2002:a05:620a:4512:b0:89a:2f2d:f951 with SMTP id
 af79cd13be357-8a8e6954ac0mr49378585a.64.1761676873101; 
 Tue, 28 Oct 2025 11:41:13 -0700 (PDT)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89f24ecbc11sm891450685a.24.2025.10.28.11.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 11:41:12 -0700 (PDT)
Date: Tue, 28 Oct 2025 14:41:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 10/25] system/memory: Have memory_region_size() take a
 const argument
Message-ID: <aQEORt9fVYQm14O1@x1.local>
References: <20251028181300.41475-1-philmd@linaro.org>
 <20251028181300.41475-11-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20251028181300.41475-11-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eWCxnKkQmha-8G7BPnuHQJKzO1rhiQnhU-ZerP2ilWo_1761676874
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Oct 28, 2025 at 07:12:44PM +0100, Philippe Mathieu-Daudé wrote:
> Since the @mr argument is not modified, it can be const.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu



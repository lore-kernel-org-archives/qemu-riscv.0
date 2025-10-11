Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E456CCD184
	for <qemu-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 07:04:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7Tes-0004TR-2Y; Sat, 11 Oct 2025 03:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7Tep-0004TC-U1
 for qemu-riscv@nongnu.org; Sat, 11 Oct 2025 03:04:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7Teo-00084l-0v
 for qemu-riscv@nongnu.org; Sat, 11 Oct 2025 03:04:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760166284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RhiHGKFAh8Z6wgLniyL4CLx+giSyiW0RLL65qJ0l6dM=;
 b=McUtbgxhjLiol4zs3tWmM93WKY/6AKlRbL7KXJqlGzKjnkriA8zlu/+oihBqOGU7y6Jrmq
 2UXefeg/1T1uudbi4vNA1J4TdbpsPNyyg0SVQIYLancYNihA9xILSGRF7+h3Xipa3EifWS
 qS9hp/OtGzef53glGABcDpg2qKJNpsY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-fGpOe2SsPXCmjbawoiESAQ-1; Sat, 11 Oct 2025 03:04:42 -0400
X-MC-Unique: fGpOe2SsPXCmjbawoiESAQ-1
X-Mimecast-MFC-AGG-ID: fGpOe2SsPXCmjbawoiESAQ_1760166281
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-b07c2924d53so280420166b.3
 for <qemu-riscv@nongnu.org>; Sat, 11 Oct 2025 00:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760166281; x=1760771081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RhiHGKFAh8Z6wgLniyL4CLx+giSyiW0RLL65qJ0l6dM=;
 b=PTGcSmxpQgqFzS70KDVfYleMvzrrLABfSnzXzm5SDapfhN5gb8DMnYXak5BilGuFZn
 IcGpUMOzOtDqy2PPdoMwZeN95vBd1h/2JibPn0NrzzVA2uKIVa0T37DVoudPUsD4R8kN
 2lDPibWGi1cCR5SnDZOjjl2AcL4RCUTXHA8p9FiV6nL01uZuK7vr0JI+y8xlxusslem1
 5mCO3nVKOEXwHZU0MzcfV0pEvzpXN3U6MHvkQmPNKCk26S/o1yfBTJMqhqCPthpY7lQr
 +B1MjxSlslWh/NnollDP628lED71rgjKjTKjV/uJDr32A5QDgFLy/Uk2N4X2yUMrba30
 Zl8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL3JX7O+uSbeEsmrlZ4mJC8C0cpqMwJiF4cyc4QcxEOAwnN5f1AWO2fDBc9FHpV2p5OnJmaY4R7OXs@nongnu.org
X-Gm-Message-State: AOJu0YyKlSEJ/a+BQjBHs8kr5C69UArhZClFX6FwcXLIj3d2kY9HzUj1
 84WTla0HUAKdjvrffgJvtcEF+dEg6/mLvAFuALvqD3czU5HRS0RN5WSpSIkSAz3mfnF3486+/es
 l9/DkO7FFzbTfinSZel6C3qLiTlMJxgMGzg7/Lrl6mc7uZtabhzpNZKa3
X-Gm-Gg: ASbGncvVaSViOKW5TLE/SeQSqOu+rVGxMDP/wnYtmJW+or4PjXADQzqFIJs5gW3NjK0
 WQj1NL98gCcsDNtlVPj5lDnPP0aZYSkYf12QjH8cimWm86KZbESPhX9P1GGUgCuzDyJ2co6qsBQ
 D4HTQhU9b7dbhJR6JJ0xCo8dGyAiz/+Mj8IgVf1SgnPXDALKyuLGXGY4WqkyHQP82zxHfsXOiAv
 DTN167bJqpIdn3v78uJwa0TJOlGuh0J8Y22IEG56MD/OxQbwtIN1KM1VsbvjyvB9XmRmcFvzDim
 B2C6cZ6GRSGQCO1q5zfT9TUpveZEkf2e5qK+CVwpN2zxK4jBATYUOs7oPvkLa88Bjeg8Mqw6D6g
 KWu+MiuaLsj5+fpP4Pdes4BrB3j7P0SV/EunC3bOarTvj
X-Received: by 2002:a05:6402:518a:b0:628:7716:357c with SMTP id
 4fb4d7f45d1cf-639d5c4fe6fmr12208875a12.25.1760166281287; 
 Sat, 11 Oct 2025 00:04:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9n3uqdrolOp0oRQFc98iGpAa9NnBDM/PKNZpAmtUcMz8AHOuFayZx2yD3ns4LycDHDbYs/g==
X-Received: by 2002:a05:6402:518a:b0:628:7716:357c with SMTP id
 4fb4d7f45d1cf-639d5c4fe6fmr12208838a12.25.1760166280801; 
 Sat, 11 Oct 2025 00:04:40 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a52b0f3aasm4013815a12.13.2025.10.11.00.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 00:04:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Song Gao <gaosong@loongson.cn>, Weiwei Li <liwei1518@gmail.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v2 0/3] accel/kvm: Cleanups around kvm_arch_put_registers()
Date: Sat, 11 Oct 2025 09:04:21 +0200
Message-ID: <20251011070420.864887-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008040715.81513-1-philmd@linaro.org>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f_FCnbE5V_mg7HJIcGtpgCT6uE9gFUQdG-jNhyW22Qc_1760166281
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Queued patches 2-3, thanks.

For patch 1, I think it's better to have consistency in the use of >=.

Paolo



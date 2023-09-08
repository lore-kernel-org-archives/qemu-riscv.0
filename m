Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A193DEE57EF
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 10:29:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeYjt-0007bp-Vn; Fri, 08 Sep 2023 06:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qeYjr-0007Yt-Qh
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 06:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qeYjo-0007D3-MG
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 06:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694168958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=CW3i3egE4SNy7JSbvXCF7sBvTHVPT5lg2AUS1pvPcTjhRvbJZH9iLS8TerW911U6yvIvb2
 orrSByXAntk0KbueK0cuVX1bKL1pT/XphMkLC+y9WXOdsnRDMH7onlu7iTv3i2244CJaYz
 dE6wV4Ka+2CU1/mTUHV+g36Lj4rRVfQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-TXa8T8Z3OS-3kkMOYvdtCw-1; Fri, 08 Sep 2023 06:29:17 -0400
X-MC-Unique: TXa8T8Z3OS-3kkMOYvdtCw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31adc3ca07aso1214685f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 08 Sep 2023 03:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694168956; x=1694773756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=dlribj5EjaSqHwN6bf7vsXqrCeV10+aEZH/2r3aDzARSkJDxc42r5Bby4HK5UJmZDY
 JpXVwfrvoSM+oyowoIDKMK9lTFOzj7+B3PQqhHI79zaeNM6Tb2bQzcJ3e9eo9jxqMjeU
 WmErC45oTnlNIiojiUvMzIisnfelqT43wZcGJK4wnWTpxJItlFOhMIHx/PiG9vFE/nVB
 k/gvesxrbg9jqXdjExcLerKXz/CqlnuuMZwpieWFFJLtIvnKITi73t3cj+ZHBSTiOq4L
 eQPHnN7u5X696qVl4iAukQRcC78Gt6uSPzR2N5pma6fUECUcL1Ibd4y8kPPwZHMzNB5c
 LTjQ==
X-Gm-Message-State: AOJu0YwB+yR1kUBNg0pGO9Qd1k4jvXkXmSjsx5E+UBVUcH4nlHvVk38Y
 j34/TsrIopKWIOxdgggoUlFKZSqtvvNPkfEtJsNgYr3V3+MUPjb8oX+IYkRkVKDJXuYiZStl0i1
 ElIR+nR+36H/S3Fo=
X-Received: by 2002:adf:e60b:0:b0:317:5a3c:ed28 with SMTP id
 p11-20020adfe60b000000b003175a3ced28mr1747554wrm.6.1694168955906; 
 Fri, 08 Sep 2023 03:29:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxAcHV98ExI/jojVny+6juceRiMCUMTU67tWwhw0XWR4ZF9i8VKprwtFKOsAtw4rVKdNmSWw==
X-Received: by 2002:adf:e60b:0:b0:317:5a3c:ed28 with SMTP id
 p11-20020adfe60b000000b003175a3ced28mr1747543wrm.6.1694168955497; 
 Fri, 08 Sep 2023 03:29:15 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4cc1000000b0031accc7228asm1726490wrt.34.2023.09.08.03.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 03:29:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <lzw194868@alibaba-inc.com>
Subject: Re: [RESEND] qemu/timer: Add host ticks function for RISC-V
Date: Fri,  8 Sep 2023 12:29:12 +0200
Message-ID: <20230908102912.535248-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908033129.694-1-zhiwei._5Fliu@linux.alibaba.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Queued, thanks.

Paolo



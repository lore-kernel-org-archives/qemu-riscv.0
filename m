Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779D6C7EE25
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 12:25:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7EhQ-0008Kb-M0; Thu, 08 Jun 2023 08:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q7EhP-0008IU-75
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 08:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q7EhN-0004RS-Nn
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 08:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686227105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Vi1kSNr4p9/YQ0YuHDtpiS2TAOwm4MPGlDBaLZ0HW8DqBZViVNkMNU/lRCNgucJe/Hu4zr
 nfpBsZTC5XnF4JyAVsYvyBQuRPMSdicq5tMaVMIwBZFrT5Xjjmpe+XM85/c1mR0pVNJ4kC
 s0/Ae1LfWLo8Owb3E2+F2pLW/giMNrY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-OBGwE4jiP1GGGHpilbqp7Q-1; Thu, 08 Jun 2023 08:24:53 -0400
X-MC-Unique: OBGwE4jiP1GGGHpilbqp7Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9715654aba1so77687466b.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 05:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686227092; x=1688819092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=MUXRNIJPokH6wQkJKjor7Cxm2SVjAkGtsIukWdXwxCM/3SWHxwYf1Ie7+p9L3+J9PJ
 lBTE255eKi2R8T7gud6SijMby3SfcsV6/y+LbGUkqmqvfwZRTDeNMYYBr8xshTTVT3yq
 7T3aKX5+CTlkQA3t5Z55DM+vqGpU2jgmZDP6uMRfth/M7OKbptcTrtI6HKwQRZPLwVxo
 P3XX1ZxdOiX0YUXqhALHuyJrStcSWzeZ3WOa+/1DWLf2h2j9urJMH2MD0k6SlTtLw6HH
 i+XRLPH0dOecGOsRN7I7pDXITTVCJaBh3DY+52/sj/XNPCk1k5wlxa5SAYzTAMOlii2s
 tI6Q==
X-Gm-Message-State: AC+VfDy6yuEvFtnp6v1F5FvqtIUxF0im3nRDxiBjGxP4M5J+ZXxBf/1f
 jLpYaJudaWcAiKsRl8YKmig7mW1mxvD4c3IN5jXCOsldX2ymCozuSU9WmqVpn4DPTso9XRJBDML
 dX+VsmWlOURF4pmI=
X-Received: by 2002:a17:907:7f2a:b0:966:1bf2:2af5 with SMTP id
 qf42-20020a1709077f2a00b009661bf22af5mr2086599ejc.22.1686227092617; 
 Thu, 08 Jun 2023 05:24:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5cbjEPnJx8LYNpohJp9xPfkKh5nP2U9c3J/hradbFa6vbQvvQtmwK74P5Vl6HmL/w2Ex2Ybw==
X-Received: by 2002:a17:907:7f2a:b0:966:1bf2:2af5 with SMTP id
 qf42-20020a1709077f2a00b009661bf22af5mr2086571ejc.22.1686227092220; 
 Thu, 08 Jun 2023 05:24:52 -0700 (PDT)
Received: from [192.168.122.1] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a1709065e1a00b00978897577c6sm631890eju.44.2023.06.08.05.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 05:24:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 pbonzini@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 rad@semihalf.com, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, ajones@ventanamicro.com,
 berrange@redhat.com, dbarboza@ventanamicro.com, yihyu@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v5 0/3] NUMA: Apply cluster-NUMA-node boundary for aarch64
 and riscv machines
Date: Thu,  8 Jun 2023 14:24:50 +0200
Message-Id: <20230608122450.915545-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509002739.18388-1-gshan@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



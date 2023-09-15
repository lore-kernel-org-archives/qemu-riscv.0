Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6760BEE6459
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 11:47:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qh7I5-0005hm-No; Fri, 15 Sep 2023 07:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qh7I2-0005bY-KG
 for qemu-riscv@nongnu.org; Fri, 15 Sep 2023 07:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qh7Hz-0004Lp-Vo
 for qemu-riscv@nongnu.org; Fri, 15 Sep 2023 07:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694778430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=VLl1/EilJUozrnYNiWegUpdQYf3DsMzKv0CnBk7V7R/Hi/TiN6bmPwr6iCH7IDAaNaDWiF
 mgZm0b6UMsLolYfApChgl5FT/SnukDfLhcjM1ik7JuuS6svSwQHbsPiJqdMbZkqunK3Two
 RSjSGl/AlRBRFcNBW0QN3csWV8flZGA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-6l2D9rfNMG2EmdZBFCeotA-1; Fri, 15 Sep 2023 07:47:09 -0400
X-MC-Unique: 6l2D9rfNMG2EmdZBFCeotA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31f8e062cadso1422644f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 15 Sep 2023 04:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694778428; x=1695383228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=uWEDbXz586qYd4SxM6Qj15DSzRE3TGQjaL5EBxGIpnAJkxG1rxyI2w8W6wGdBnI10x
 WTNOfM5x5aHlSjFvLi0+nMZqoaF44h1kYyydY/qvmEaiBoG0HqAntXhKSFLJ82GHry+y
 urK60XgU5AiDKn0tDKJJbj4WV9MwGapETn+QW2Pna+SpXsSy/MPQ36/RbiJfuPxMViNw
 rNWRVSH87wa6Bjn4rC8AggPeLJRZmCb6nVJsFFulMZOqaX1u5Z4yFMlZr6MUE5pgGFga
 KVvtszyZpLVkJhO0pK/iudu4tH1Fi42Fq7VAin+7NGMzWqZNA2bCDyVfu+uGypEesd+n
 qeuQ==
X-Gm-Message-State: AOJu0Yx+xjwATI+T37kZRchK0seM4ouq+YBnJhiQgCJv5N7EtDQiCOkm
 Uy627WGLSGezZFWmhswImDDnf1JwB6zQ8IMUDX2C4F4CCeCC28kcZ0vgBULozZbEx9u81yYWwZx
 ddBQWnoTCZfodGig=
X-Received: by 2002:adf:f805:0:b0:31f:e5b8:469a with SMTP id
 s5-20020adff805000000b0031fe5b8469amr1110756wrp.16.1694778428046; 
 Fri, 15 Sep 2023 04:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP1jxgmaa5FuSOTYyIT/kmJiYbf36gfTMYbQTBiqqiufJO6CjyOfBzPhrdFtEVDE5raU4GGA==
X-Received: by 2002:adf:f805:0:b0:31f:e5b8:469a with SMTP id
 s5-20020adff805000000b0031fe5b8469amr1110743wrp.16.1694778427720; 
 Fri, 15 Sep 2023 04:47:07 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4141000000b0031f300a4c26sm4197370wrq.93.2023.09.15.04.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 04:47:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 atishp@atishpatra.org, palmer@dabbelt.com, richard.henderson@linaro.org
Subject: Re: [PATCH v2] qemu/timer: Add host ticks function for RISC-V
Date: Fri, 15 Sep 2023 13:47:03 +0200
Message-ID: <20230915114703.1094513-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911063223.742-1-zhiwei._5Fliu@linux.alibaba.com>
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



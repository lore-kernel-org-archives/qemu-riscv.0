Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D4EE7B611
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 13:20:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qo1ne-0003iD-9W; Wed, 04 Oct 2023 09:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qo1nc-0003gm-4H
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 09:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qo1na-00061S-MP
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 09:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696425622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=GVPtsVsus6WTHlmZMKpR9L0377Ja/F7RdKFpzw72Sn7sLYQdfX9G24NcoyJbZOB90WpVMf
 K/CkTVo9PqwRjazOD8QkD9Lsl/6RlrmQ7B/SQxkXQQLAQ3TCClgorH6cJf5uSyH6q7hxGq
 6m8LbqULxpP2s4wa8H3oMR9emLj5Va8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-dQUqRMn9M2WVBIrq16wJMA-1; Wed, 04 Oct 2023 09:20:20 -0400
X-MC-Unique: dQUqRMn9M2WVBIrq16wJMA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-993c2d9e496so186038066b.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 06:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696425619; x=1697030419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=tol+UxCzthZFztiZCrtUnpILkaFnGTo9eRscm4lhAn1rATbNTBKZtUUBSWbmzdL03h
 /KmoKnN8NIR2F/89xZubhou9wmWKjIz5u6Yo5UEetj9gyMn2+6gR/fu6tgtQfXUjyuPZ
 DZmhsyd6UZwWcbw/vv5BGelx9v2MptmaVn8AdtiaSqSU2uhPg6Gd9i2KCgLBs/5Tbgix
 hhEbxOZh3BeWEaip3xKFL9MjCRybaeHyD8oCKBVMoMQ7mW8uM3tydbvCk96PKgVynDCM
 KCvPWllE4HiRLxj37gcgEoWtmLeiS/uOU70Aw+8p12KwjUynWvjQ75ZSh6bf4GcDa20B
 3eqw==
X-Gm-Message-State: AOJu0Yz3ur76fPYS+1YaLRq1YnCjH0NkWauiFZ0O907oYDQHl9Gs2FVh
 qkrP9kadtBjyPGkxOJN5aLBwzNfEmUjHNWznf/04xmq701ytcINpegn2PBPGz1Y6F1XyVgcIiR2
 UWq8icAHij+t5qhs=
X-Received: by 2002:a17:907:6c14:b0:9ae:588e:142 with SMTP id
 rl20-20020a1709076c1400b009ae588e0142mr1874247ejc.67.1696425619661; 
 Wed, 04 Oct 2023 06:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7twoX0IrFRKnVeuTHTo0/s8bsG7IxMJOotAEN++BJAnxA61mis/O8yWE9UyaGy0rZWZnOAg==
X-Received: by 2002:a17:907:6c14:b0:9ae:588e:142 with SMTP id
 rl20-20020a1709076c1400b009ae588e0142mr1874229ejc.67.1696425619330; 
 Wed, 04 Oct 2023 06:20:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 um14-20020a170906cf8e00b0099297782aa9sm2778308ejb.49.2023.10.04.06.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 06:20:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
Date: Wed,  4 Oct 2023 15:20:17 +0200
Message-ID: <20231004132017.160874-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



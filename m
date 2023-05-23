Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C65DC7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 09:58:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1OmQ-0001l6-3g; Tue, 23 May 2023 05:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q1OmO-0001kW-TG
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 05:58:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1q1OmN-0004W5-Eu
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 05:58:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684835885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=meGlVScgp4E/9EyKaknyqI2LILXJtH0E2WucGaDJ54s=;
 b=jAFG8r8NxG2IfzV7ew4EYNZarqNC3bGMSdop5j1FgwRLoON2fbVXB7FpJbLsNVIsZkZSkR
 gkBGgPWnXCI12HJbAesLUmQWl8oiMNiU5VicJKFaalLvXH3G7eTjOaEYWYnNflvfrjYvqc
 rzeCIWuwLH4fsLQks+WaFuj6RFc0HXE=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-CwN7Co_jNUe2FyXUssjQGQ-1; Tue, 23 May 2023 05:58:04 -0400
X-MC-Unique: CwN7Co_jNUe2FyXUssjQGQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-52c3f0b1703so6889994a12.1
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 02:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684835883; x=1687427883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=meGlVScgp4E/9EyKaknyqI2LILXJtH0E2WucGaDJ54s=;
 b=Er0HmUWBmfx8nEfFn3y0/BPRa9ncA7sEFAJdSL9Y4iMm+x3WjeJQt696FqSHp3ZunG
 DABEdQuGhruwhJjzeQbwyrq4XmgIO+zpGk06XsaKChMNlai+ZBUu6hziT3NZ4cZXGVBk
 Q57+DMxg3FAEal0htI1yQchNjpOD1Q7gJVR7KJ+w6eSVAcruNfHrlcfvARZyIlQfADXS
 iC/iLV2m/YLTZeBGFujX4jxAsf/KP29Dyz9/7I+xUIiZx4J5bW5irRoKVHpAj8PsQ/gF
 zrLRWG9+WuZ4wbQLLeTAaey+sDy7j/SW6eJGuXO3JX8idFHeckAnodJv6HZUTbISSIGY
 fZ+A==
X-Gm-Message-State: AC+VfDysbl11aL+hA584PxxYLPOou8jQQSQp9rfyvrnKgpDOsC0+mdFm
 /8qZK2hqSDMLi0QIrl0CiPyyfa9P2r08MpxFLYk1Qs41LDuWBhH2x7W2Ukyzl5DEnmRp+muU63Q
 eEcNoiuCdhh7VIdIoa6HQuNjr18gFm88=
X-Received: by 2002:a17:902:db0a:b0:1ac:5c90:23e with SMTP id
 m10-20020a170902db0a00b001ac5c90023emr18904143plx.7.1684835883596; 
 Tue, 23 May 2023 02:58:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5eaaCLR0AdtbwCmNwQRHZdBIQugnxVaNuz8PY0WIXfOKcuW8A8AlV2kVMITyxwADiqfjYI7u+CCxYOkeJARn4=
X-Received: by 2002:a17:902:db0a:b0:1ac:5c90:23e with SMTP id
 m10-20020a170902db0a00b001ac5c90023emr18904119plx.7.1684835883325; Tue, 23
 May 2023 02:58:03 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 May 2023 02:58:02 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
 <a8dd5f20-30ab-903a-6bd0-15c6a91fdf52@linaro.org>
 <CAKmqyKPHsjtT03MdSoy4i0TgdLBF=88aS6S32hj8hzpz60d6Dg@mail.gmail.com>
 <ZGW/vqOD6E263wDD@sunil-laptop>
 <3168ed46-f6f5-3b4d-8639-05dc499862f8@linaro.org>
 <4e451a41-f60c-456c-2a48-6140a3b4a018@linaro.org>
MIME-Version: 1.0
In-Reply-To: <4e451a41-f60c-456c-2a48-6140a3b4a018@linaro.org>
Date: Tue, 23 May 2023 02:58:02 -0700
Message-ID: <CABJz62O6cd-De0JMS=wyF6DZKmMgHrZULm_j1EFkzfSgj-qxTg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 19, 2023 at 06:40:37PM +0200, Philippe Mathieu-Daud=C3=A9 wrote=
:
> > On 18/5/23 08:03, Sunil V L wrote:
> > > Agree. While I agree with Philippe, I think we better solve the curre=
nt
> > > problem by going back to v1 of the patch.
>
> BTW clarifying, I'm not rejecting this particular patch; I was just
> trying to correct the idea than "doing what other architectures do"
> is always the right approach ;)

Definitely agree with that :)

But there's a cost associated with going off the beaten path, which
the benefits must then outweight. There seems to be rough consensus
of that not being the case here.

So, can we get v1 merged?

--=20
Andrea Bolognani / Red Hat / Virtualization



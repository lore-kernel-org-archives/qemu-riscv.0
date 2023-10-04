Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C73E7B60F
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 13:27:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qo1tv-00085L-L2; Wed, 04 Oct 2023 09:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qo1tu-00084t-Fe
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 09:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qo1tt-0007JZ-2B
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 09:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696426012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJXwDMO0kvLWg+nqsg5Zr2ChoY1CgIe/vOujBdEiq64=;
 b=XBNoUXSNi4Y0uykUm1ORYHGyIdh3wHuZyV+LUZbJy3mNcMNcebTxvnaBuzzZLk2Jk0b1mF
 /Y8T9Mln+/kzzLBxpON3dmSRwDeEJy2/Nda/GjNtJTJn1+eE0+CmJMa3Xb74V/+UkSEstU
 HLAKPOcCiPeAokNEMYtRAe+kCcW2aqI=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-SDIasY5-MF6qmUroOffxjQ-1; Wed, 04 Oct 2023 09:26:48 -0400
X-MC-Unique: SDIasY5-MF6qmUroOffxjQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-d865a8a7819so2710334276.2
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 06:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696426008; x=1697030808;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UJXwDMO0kvLWg+nqsg5Zr2ChoY1CgIe/vOujBdEiq64=;
 b=B0/TeDOMXV15B2sBC4j3CmvyTBxztsfXTtbCrNM0Quwt7uaJHU2FL7DDc14Y6qZNCC
 KrQ/1Wqn20yDem811+ljjmvhpCrWKbOkAA29bHWekAIFnQu3+OWaE5bkTDF/iNnp1aY6
 +6BuhWqHItdeK0i/gCSH4XOfFaDESwn5CCPyGdPO63R0X1PZHQkPTSSZ0bXWseLBpnNZ
 H3GbalRoYOMDwA0P3oy/PXUtSGU+jjAwrDWyEKFtfERLVIP/6XvB8jYQCa560otKgUpn
 hnpmAy5kGHhFKFT+krIm2GoZcjmzMSX88cwWITC432GfxdoSZqRM2GaDjDmzTqBj2juP
 tqOg==
X-Gm-Message-State: AOJu0Yy6M2BQQRJQ7escgm0QTmAtmuaORqD9tjWdKEPIAyD8NMuDLFS1
 rL1Ej/7lTQDfM+1VMNme6f6Xp9KByKz0/T60j6FbpCvFPMSUwjEE3zvftVq1PJBFD/38JTcfJae
 yvs/wAkq+u9tT7QM=
X-Received: by 2002:a25:d884:0:b0:d86:aafd:dcba with SMTP id
 p126-20020a25d884000000b00d86aafddcbamr2079110ybg.64.1696426007973; 
 Wed, 04 Oct 2023 06:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5c9QkxFakXUq8YSm4iSKXnFb4W3VWu5feqM+9tLyqUiu6VxchlcAbWzLOd6HsCKH76Zeb4A==
X-Received: by 2002:a25:d884:0:b0:d86:aafd:dcba with SMTP id
 p126-20020a25d884000000b00d86aafddcbamr2079094ybg.64.1696426007719; 
 Wed, 04 Oct 2023 06:26:47 -0700 (PDT)
Received: from [10.33.192.181] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a0caad3000000b0065b13180892sm1339151qvb.16.2023.10.04.06.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 06:26:47 -0700 (PDT)
Message-ID: <89be6f1b-7658-82a2-b877-7b89733430e3@redhat.com>
Date: Wed, 4 Oct 2023 15:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20231004132017.160874-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20231004132017.160874-1-pbonzini@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.528, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 04/10/2023 15.20, Paolo Bonzini wrote:
> Queued, thanks.

Ok, but could you please wait with a pull request for a day or two to see 
whether we could agree on a better wording first:

 
https://lore.kernel.org/qemu-devel/85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com/

?

  Thomas




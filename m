Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D87EE77188
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:28:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNws7-0001is-Ly; Wed, 18 Dec 2024 11:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tNws5-0001bo-Ah
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:26:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tNws2-0007nS-Ok
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734539156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r5JJSS4cJSqnn/MEVRTYbUDJnDkKD81QZB2/Z2Hzk+o=;
 b=c6BtrEsJP7EBVDtndOHItIMvUsUvNn+pvTTeHVSKQmcVcmUo7KVU+CkszuvMfjMnLrdBN5
 Whfy+BqkbjNP5inJlkWYK3C0W63PPdyyljH3sp2CQOo/Ewz/KMXR9Ebk1VMIftYHxptRqk
 7RVoPmPSmKtqE6HTEf0DzqwaI2gzmQM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-3_Ifc3bVPZqlAqURnBB1ig-1; Wed, 18 Dec 2024 11:25:54 -0500
X-MC-Unique: 3_Ifc3bVPZqlAqURnBB1ig-1
X-Mimecast-MFC-AGG-ID: 3_Ifc3bVPZqlAqURnBB1ig
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7b6c6429421so1032280985a.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734539154; x=1735143954;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r5JJSS4cJSqnn/MEVRTYbUDJnDkKD81QZB2/Z2Hzk+o=;
 b=tj6T0ZsGjjOphObbYnsZM24+vhkzGSuHoWAZypq0XEe4DicfuIa1BUuX3kihhuxl5V
 tT11Nq9GAxZOt7asNvt6bdt03mRM526NRDdcgrY+BBRa9M0SFtF2pxTC/jNagwfIZJ3w
 qdZzsHcTXI1BrbEWZSZB9KfR0KEsIRbYxzSWZOye6DbU7APdTLxriRW0HqRoS9kYhCHQ
 eRb5R5yzGmQJPZNWDWkSddpN6veFEWFy8TkXI/NwSyyIaQas5SokGi2xGftATRiR2ccu
 YGKWBUsReuoW/gzPN3eyQ0/ERmLzO1OJQ5aJXOCSCMhyjGv++jZPXJ/AiSjz7PArxLpV
 RYiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd8rlJTP4m0YoFQ6ZVOxEaVJbh/s8kqkAqEMuTICRq1J3oC5qnIK/nnB6EykCKM7Fze5SU57lefx5l@nongnu.org
X-Gm-Message-State: AOJu0Ywc10TQa50LESLSo+r6/G+8ZRDfsKfsrmuKKQIdksrEtbsqThgT
 0lsfmd7qliy8vn7BV8IFYfwvPlEBIQ1CLwQee33KD+lQPfExrGABgf3bU3nSMwA8suIT+NEI/Ck
 HF+azVA2i76IWGSOsnfrVtmiBQu+XX+BZgsRInVkkjzrFnS9JI/zS
X-Gm-Gg: ASbGncusECJBqv2nS+bl6vGx29nK+cbPlFWPepSrDXVu/IWnUV0nxS8XfrruzNKbfkE
 mQEtK25Uzb/JzznwUgt1Zlan+Vf9Ye9QmqEv+UTRr0fggjM3YoKojZYXqZQk/BtWQbwrW9gM6cN
 sybQZ5+UEQbhwJU5e0qfVjZ3GrGM0nYLThN0xdRTZ1w7vWfVkVfnNSdb8zwxl9TXc/ZWaOBucJm
 ei1YKxUXSuAKTt2jqZrP15jYHiW3d6gRnxCJOw+HXATHBhXgjMqIs55rO7rLK104mLEwwDrsU4Y
 ULP0/qo+eXGI
X-Received: by 2002:a05:620a:45aa:b0:7b6:e47a:8e13 with SMTP id
 af79cd13be357-7b86375d0e9mr473000985a.31.1734539154467; 
 Wed, 18 Dec 2024 08:25:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzmT4OrNRh3Wnx8sNZKszd6I2fb7aWAYKqTnxX48gPmyTiJCL5s6OKy0liV7BU7iUfLulpRg==
X-Received: by 2002:a05:620a:45aa:b0:7b6:e47a:8e13 with SMTP id
 af79cd13be357-7b86375d0e9mr472994585a.31.1734539154160; 
 Wed, 18 Dec 2024 08:25:54 -0800 (PST)
Received: from [192.168.0.6] (ip-109-42-49-186.web.vodafone.de.
 [109.42.49.186]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b7047cd507sm443078285a.31.2024.12.18.08.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 08:25:53 -0800 (PST)
Message-ID: <49df9668-5345-402e-bb0b-6a7e787c6da6@redhat.com>
Date: Wed, 18 Dec 2024 17:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/27] tests/functional: remove hacky sleep from the
 tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fabiano Rosas <farosas@suse.de>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
 <20241218162104.3493551-20-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241218162104.3493551-20-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fJz5wh20sAXcag7TpErHdodgW3u3baMwcZ8TBpu3Koo_1734539154
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.116,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On 18/12/2024 17.20, Alex Bennée wrote:
> We have proper detection of prompts now so we don't need to guess with
> sleep() sprinkled through the test. The extra step of calling halt is
> just to flush the final bits of the log (although the last line is
> still missed).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>



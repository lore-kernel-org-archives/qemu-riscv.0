Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC24C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 07:25:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q25LX-0007qi-In; Thu, 25 May 2023 03:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q25LW-0007qC-FW
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 03:25:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q25LO-0007rW-Lz
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 03:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684999506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQj95M7nBCjyXkBdl8rxd3jvDg49MB1CqFyzKDAKb0s=;
 b=Fm5lNQ4tRzgwqEqJ6iIOMCpLGmVVe2g0V83y8yI9q21OpiltbodZawPe5PEzlHxzgeYRMm
 9HPas+WBdtnpOjq4mKbv0nfSXkoegWFIqEIvcWdiP6AjM9nRB/pq8rhN/wF3Ud5AkIEI0a
 SwzFO/qQllnHWwZ7RROFukTn8oXW9P0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-UZ_trxn2PjSKj3eBIWcD2g-1; Thu, 25 May 2023 03:25:04 -0400
X-MC-Unique: UZ_trxn2PjSKj3eBIWcD2g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30aa5fb26b3so1175906f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 00:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684999503; x=1687591503;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tQj95M7nBCjyXkBdl8rxd3jvDg49MB1CqFyzKDAKb0s=;
 b=TSwvnbthlBBx1k7SRN3fyh0ZGVuKB0Axz7trh+QEawiYxSYzFwoCF4DMbSM/7/I8P9
 cS9/njTVndUHveC48yfgUDRRdgmccAk75Xa+TKMxLg4/UQ+ob1BdrsBQlZn/P6HKnrmF
 flqGU+stEG9pxZiT2u8xxUqhTF9ywr3i6wQY9484eDb4iXXpzYFDbUlOLDwkg7SEizr+
 cRIIs5f+DHIpMSuYYZKND46B01MMmY7lYe4r3qGMwOIf3o6JFbz4hIYxYnJ9u1Xi6n/q
 tbn75XWl0T41JgceCplr4jKQmaro7501W+UzBYrtLxfRXkvzaa4PrSVlY3JLKjxxFMQp
 KB6g==
X-Gm-Message-State: AC+VfDyO/Ln4l/nmSdxi9oTStnz/gP2WR7B7Uf4dbojXevBd1XSFKe4G
 p9LKq6+hDFK/EZb1g6ZFGEg294uYk3m3o2YvlLWc7wfJlyzeNOxUb2pf0uOUoASQm0RQPzfFLuq
 a8qx3+I7PE11cZnA=
X-Received: by 2002:a05:6000:1092:b0:307:4836:64e4 with SMTP id
 y18-20020a056000109200b00307483664e4mr1500048wrw.52.1684999503492; 
 Thu, 25 May 2023 00:25:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rb3AhJDLK0jwM3ozMxUlmdh70WjRyaX0UThQj+y4eyAXuRXcrRfiy2nqRM3/vvaJa9V7/ng==
X-Received: by 2002:a05:6000:1092:b0:307:4836:64e4 with SMTP id
 y18-20020a056000109200b00307483664e4mr1500034wrw.52.1684999503198; 
 Thu, 25 May 2023 00:25:03 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-30.web.vodafone.de.
 [109.43.177.30]) by smtp.gmail.com with ESMTPSA id
 e18-20020adfef12000000b00304b5b2f5ffsm748471wro.53.2023.05.25.00.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 00:25:02 -0700 (PDT)
Message-ID: <9b628cfe-0916-fe7b-f836-9b170335ea0d@redhat.com>
Date: Thu, 25 May 2023 09:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 3/3] tests/qtest: sifive-e-aon-watchdog-test.c: Add
 QTest of watchdog of sifive_e
To: Tommy Wu <tommy.wu@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, liweiwei@iscas.ac.cn
References: <20230523084910.304679-1-tommy.wu@sifive.com>
 <20230523084910.304679-4-tommy.wu@sifive.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230523084910.304679-4-tommy.wu@sifive.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 23/05/2023 10.49, Tommy Wu wrote:
> Add some simple tests of the watchdog timer in the always-on domain device
> of HiFive 1 rev b.
> 
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   tests/qtest/meson.build                  |   3 +
>   tests/qtest/sifive-e-aon-watchdog-test.c | 450 +++++++++++++++++++++++
>   2 files changed, 453 insertions(+)
>   create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c


Acked-by: Thomas Huth <thuth@redhat.com>



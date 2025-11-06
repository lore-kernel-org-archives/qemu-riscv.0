Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27906CCF9F8
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 10:46:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vGxVW-0000Uo-OT; Thu, 06 Nov 2025 05:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vGxVU-0000Ql-LN
 for qemu-riscv@nongnu.org; Thu, 06 Nov 2025 05:46:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vGxVS-0001wZ-9K
 for qemu-riscv@nongnu.org; Thu, 06 Nov 2025 05:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762425977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Up+ukWwHkDoEVhfSrrAF2Mn5BJY2/caNC2Gy5QaY59M=;
 b=bn0Vyc6kSLelwhPGmHawnydjwTxrBh+UaSZozeyr6e50CZUvfH4FdqBN9oRggyCt3jmSev
 6mr3wsTZS3sTogjSRbxWCEIXPWr+8Qh403Xx1/DdNUUKtuo0VsXjnvhT2qSi/57Hwpx53v
 7AiEbTmWnZN71gEy7V+9pZF0IcBzf8E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-TmAHd1SxPA6ppcW_J9FwKg-1; Thu, 06 Nov 2025 05:46:15 -0500
X-MC-Unique: TmAHd1SxPA6ppcW_J9FwKg-1
X-Mimecast-MFC-AGG-ID: TmAHd1SxPA6ppcW_J9FwKg_1762425974
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-429b7b46eebso824610f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Nov 2025 02:46:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762425974; x=1763030774;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Up+ukWwHkDoEVhfSrrAF2Mn5BJY2/caNC2Gy5QaY59M=;
 b=oGvscGYyHrB+67aRAMsjUiR4fWH33cI/YKy7fasUXOKJKBMex27msHFv/Bsfc1nItL
 VfnlaZmIPH7sqttmzxapjAg9fhBVSdQ3K8LiP/yqYB+96CWHtvQsrOJ0Bu7UBtrUIAkV
 oGhd2MpBI6JmWYuY/kPSGF8xboZHnOsPZDf1pLsCzObZwmekCxdm7ap3NN/4K6ebJwCG
 mTUfoXc7isjfwPW9Do5LW1w81Sa67TLw8qfTd2CHpdsKmu4e5Pofg+gW/K2op0p7p1GP
 XyIIzRE5M3lhAZqHaU8xnhtxulDnDrxGhiqmyTZxmCalXXro0BiWUmE/YKZuxJtibi5g
 CNPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRcQbbNSpDKGMfoOKRrYdvo/fp3Bb85EENaF8B8jQzpptzYuz16xR7QnG3GUFHZKiPcYzY4aEOxQCE@nongnu.org
X-Gm-Message-State: AOJu0YwZrz0gVw6gXBO5LbNqleJm/HLGb1uJQKi1L7ZR7caHv4xieF4Y
 ocdA3YTShh3fwvPQ3sbNfvpO6LHkljAFPjKl/xooAgy19+hfKPep26982DRqKtritvTcJtGggWL
 WM814VyRvPZXuHCVUo9qIfac4LEielHe0R4f4ogZvKyy1ShTzcTFkggny
X-Gm-Gg: ASbGncuUwkCPkwGbmNg1v8HZW7JMAquAkrz4G16GM3c+FBEMQTfj5m3PNzeVlXEjd/V
 B4R+0KMo7E4nZhN2vyDKkG2WJjgeKiWsx4BnnU3q/hVerXPotMmxV/EDgVLxMMzLbHtTaxSJhCH
 csHT+I6Od/koBjbmSsJePyASN+cTobhsJGm1BNx7uRTb7LUso16zOgcTS1MxXUkOpEs0FWWGoZK
 U0EM2dEKEVvT0jRraNH53DtGReiGL+roOdyEOUOilD4S4Vu4YVp/H9mCDAbKR37dM0ku76H5XL1
 y4CMI/tyKQ1Qh40CExMcA7qwFQbTnqvDQRKO8QGqsnDa4o0doiPSa53wN87YzH7XH3fJveVKpHt
 mcg05TE4ex/10M2tAP5bO0EFotAQ2vnhGpnyW9AXTYgL7Rx710t2FUwx/qfG2OFJ1+30B6Qfumt
 rDj/+F8RCGyUJ7pY7wzCHf1XNKNLvS
X-Received: by 2002:a05:6000:2508:b0:427:928:787f with SMTP id
 ffacd0b85a97d-429e32e9289mr5044519f8f.21.1762425973988; 
 Thu, 06 Nov 2025 02:46:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6/i3Fl5ruHaSnnskThEyvpBmJzmuvn4+KwiUi64NvZ8ndC8kUvaOwdt6zCpu6MREtJCJlJQ==
X-Received: by 2002:a05:6000:2508:b0:427:928:787f with SMTP id
 ffacd0b85a97d-429e32e9289mr5044496f8f.21.1762425973587; 
 Thu, 06 Nov 2025 02:46:13 -0800 (PST)
Received: from ?IPV6:2003:c1:b731:ac01:f439:afb3:7d4f:72d9?
 (p200300c1b731ac01f439afb37d4f72d9.dip0.t-ipconnect.de.
 [2003:c1:b731:ac01:f439:afb3:7d4f:72d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb49c394sm4223217f8f.41.2025.11.06.02.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 02:46:13 -0800 (PST)
Message-ID: <c860c211-f0e2-442e-954b-cfeafca511b0@redhat.com>
Date: Thu, 6 Nov 2025 11:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] riscv: Update MIPS vendor id
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "cfu@mips.com"
 <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "philmd@linaro.org" <philmd@linaro.org>
References: <20251104150708.3345289-1-djordje.todorovic@htecgroup.com>
 <CAKmqyKNV9Dc5-mszwg8aFCkqLiASLZ_u+dbLLyG_59usMAL6Mw@mail.gmail.com>
 <5301acd3-6e1e-41f0-9cf0-f262bd8c5521@htecgroup.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <5301acd3-6e1e-41f0-9cf0-f262bd8c5521@htecgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bJTqnECWWWAA9wEW2_JKLaIr0zluctGCM4KYN7DkFcY_1762425974
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 06/11/2025 11.16, Djordje Todorovic wrote:
> 
> On 5. 11. 25. 00:08, Alistair Francis wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>>
>> On Wed, Nov 5, 2025 at 1:07 AM Djordje Todorovic
>> <Djordje.Todorovic@htecgroup.com> wrote:
>>> We have already sent patch set for introducing MIPS's
>>> p8700 CPU in qemu at:
>>>
>>>     https://patchew.org/QEMU/20251018154522.745788-1-djordje.todorovic@htecgroup.com/
>> That series was dropped as it failed to pass the CI tests:
>> https://patchew.org/QEMU/20251023041435.1775208-1-alistair.francis@wdc.com/
>>
>> You can just include this change in a new patchset
>>
>> Alistair
>>
> Hi Alistair,
> 
> 
> I am looking into the
> https://gitlab.com/qemu-project/qemu/-/jobs/11827080939#L5859
> 
> and it seems that it did not get the binaries from:
> 
> https://github.com/MIPS/linux-test-downloads/raw/main/p8700/fw_payload.bin
> 
> The test for Boston board should try to download that, but there is
> TIMEOUT set for it.

According to the job log, the test has been added to the "quick" category. 
If the test downloads assets, it has to be in the "thorough" category 
instead, otherwise you might run into timeouts when the download takes to 
long. (See also the "Asset handling" section in 
docs/devel/testing/functional.rst)

  HTH,
   Thomas



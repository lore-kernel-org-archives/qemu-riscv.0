Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6A2C0218F
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 07:11:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfD5S-0002LO-HR; Tue, 04 Feb 2025 02:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfD5Q-0002Kg-DJ
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 02:11:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfD5O-0004xY-85
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 02:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738653065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QeKfa3/FqNOrTsiIT5bZDFSMoxo3ZoxiTxGpBbOMIG8=;
 b=Zy21hbddpC87huiGLWesZ5+xkjPa75aXHvnRFQGQ2TANIFoVwW2WYP8mlPtkr1EnbR2GGD
 5oYeCxjz5TSWFhCfLNqwmSJLHo00adTqjEmpSVp5wHZaxeheS5+10TB8jYEqBYiwH0Xoo+
 tzQkH0Q+OuH8aAWOdJX7WONTzgpsX5U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-Uin2ydPKNsG-ab-BcmCbxQ-1; Tue, 04 Feb 2025 02:11:04 -0500
X-MC-Unique: Uin2ydPKNsG-ab-BcmCbxQ-1
X-Mimecast-MFC-AGG-ID: Uin2ydPKNsG-ab-BcmCbxQ
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38bf4913659so3588346f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Feb 2025 23:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738653063; x=1739257863;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QeKfa3/FqNOrTsiIT5bZDFSMoxo3ZoxiTxGpBbOMIG8=;
 b=DyV00MWGLkJhI7T3aQJnFf/f9oluuapxegY/eehKlpc4GDpANilUQ8XSGQLGVBL2R3
 UjfCsRlgQPE0bJj2DqofVWW8G0zvDO63hWOTVE+qc/nsay9OqjnnUyWxYJ1MSBfyD3b7
 eoWqEPmE4Nkseztn/EG5QJpd96ikXGMNiiwjMx7QoTIki3Lei+SiP8qSiFkvWTQ5pw7p
 oZRpq3rO5il5+MhcaeZUNkD1IkFSN3RhxvhweJDiiJ26eBqJNlsoBv+JvyD7nateVUGX
 exJ6FHsDEq51ncKebNVIayJoBOeExY3Ne8/dk3o9HeoxwxUD/wl0dKdhpEIswg/BspRr
 OSDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoNGph8OxBlCzI1ZBen+TFVvhqPNAKv99LioDXyyyItS8wydFRctayJL3s0vktyCP7NryhexzlSg34@nongnu.org
X-Gm-Message-State: AOJu0YxueaOHY2EXnWVt/0BShs/irJeEG2wr90iTFXBETx9hi7oJ48wT
 2qx9bGzSwDWpQQ2gXFra7ZayY3bMv4lhAgIzBgJ/Bkq+kM+Wvj9FI1EBKBRj8mxsrc9O9sOKMU/
 3tWzvP1P1hIU7nqoqAHeLw4cZsaF6TPHquxfV51lzUN81Nkr8Xj98
X-Gm-Gg: ASbGnctAQoohJH2ByqDPF3HQGBlTV2+AzdfeIDfA41wiaHInzWZRr2iuZBWr9jc5hUT
 tC9vQQvayfcwMLBCHEQw7I5Hk7pjoQyrlyKRh/ZvfCSTcCT4K0/qTSVu/u7aNlyH4VTeyZ/stDR
 G2gloNTXpGYRe36bI89v952f7V/PNaiKz78Nq0oWvFZdAuZfUKWs7oxvjCWbsg6x16I19alRlDO
 7pT6yDktNvTAe2KKQPrnoB9RFYk2eXA8vpU21CTqfrKUZj7HxiX9kaP3gc77s8m3aatBlYsZSVo
 w3wE2oRmc6V62TRIaP0WscsHqcwPwBFGOgwP
X-Received: by 2002:a05:6000:1884:b0:388:e377:8a1b with SMTP id
 ffacd0b85a97d-38c51b60c11mr19565154f8f.28.1738653062951; 
 Mon, 03 Feb 2025 23:11:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE83OA2ZdyUwpCoRoa/dxWcenK51tCxhFW3QmQtkn2l5hNJ2xyhgJCA3aB1GNno4GhZ+fAV0g==
X-Received: by 2002:a05:6000:1884:b0:388:e377:8a1b with SMTP id
 ffacd0b85a97d-38c51b60c11mr19565135f8f.28.1738653062640; 
 Mon, 03 Feb 2025 23:11:02 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1016easm14856161f8f.24.2025.02.03.23.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 23:11:02 -0800 (PST)
Message-ID: <03497b94-e681-4bf7-8e1a-471d616219da@redhat.com>
Date: Tue, 4 Feb 2025 08:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 0/3] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
References: <20241125181420.24424-1-philmd@linaro.org>
 <219be312-4acc-46c9-8a56-16e5cb483ae4@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <219be312-4acc-46c9-8a56-16e5cb483ae4@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bc33KrIQECOkVeuqEwihPkIHPxVuFX-OvXB_-x1WM3Q_1738653063
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 26/11/2024 06.24, Philippe Mathieu-Daudé wrote:
> On 25/11/24 19:14, Philippe Mathieu-Daudé wrote:
>> Invert MachineClass 'no_sdcard' flag logic and rename it
>> to 'create_default_sdcard_drive' to make sense of this
>> default value applied to all machines. No logical change
>> intended.
>>
>> Philippe Mathieu-Daudé (3):
>>    hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
>>    hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
>>    hw/boards: Rename no_sdcard -> create_default_sdcard_drive

Sorry, this felt through the cracks, but I think this series here is indeed 
a much better idea than the code churn in your other series that simply 
changes the bitfields into booleans.

> I expect next steps to be:
> 
>   - Remove nonsense create_default_sdcard_drive (where
>     machines don't have SDHCI devices)

A fourth patch like this would be very welcome, too!

  Thomas



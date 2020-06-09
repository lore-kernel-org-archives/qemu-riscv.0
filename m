Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jif7v-0007uO-Bl
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 10:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jif7t-0007sQ-Lz
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 10:21:17 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39642
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jif7s-0000XD-Kl
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 10:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591712475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mKn89GE4yhBVAiE11TJdbe2i5inOVS2QTjmPTgDJ69s=;
 b=Rjn17yGguO1b9L/FmNyWWmyZcnqjaEGVgaq4933tyoZP7GWIdxv61iHBAr8zvtMuBBO52g
 MrtzQRzo6P2N5iZ1YicmITY/OmH32OoLo6NCdZv8RRrvfWRPJy5lxL2N9K/nZbfKRLcj+F
 CIpmP+AnVAdrJBLdzE40pEVnRzA9bMM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-R00OWaXWNReLKYbyr6i5jQ-1; Tue, 09 Jun 2020 10:21:11 -0400
X-MC-Unique: R00OWaXWNReLKYbyr6i5jQ-1
Received: by mail-wr1-f71.google.com with SMTP id o1so8626808wrm.17
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 07:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mKn89GE4yhBVAiE11TJdbe2i5inOVS2QTjmPTgDJ69s=;
 b=nUvntvEtjFTGEDYFswKU1VzwSvIp2GJzPSuCuU6pXLHXe37gGzq3n+FyqZqwjhBQ7E
 VA7Ph86vaxa1WVSDVDPJEjxgq1nv24t2NW+ztdQkbEsjhkgjoG/j/4VSrFegzFGucX4I
 zIgpZq//2mmXo9aMfthj0dHAwGBXRtUNBlBrdQDVedBMyr9mwNEO60Us0n+6qod/GyTy
 IXBV74teWbnRiBG8rAjAGqHInyOQq/ye7/53yj7lVkU4a8/tOgJZd20NpxPufNsxQtTX
 HZtfj1XR5N/rrtw4XaQBiBEjSOUevFRu1VsWeqwRqiebDB4ymOJM7rOo6E4f1IvjaeU+
 8oDA==
X-Gm-Message-State: AOAM530GQknI/BfYBCTtZ5dxmdL3aHJTnNV1qGqn3Wwot5FUzPAj6gE4
 dCfYfs5cR2l22hvSrM0m6aTc0pyHDKme+XP2ZHcXCni2j9pAqebg7mzGLaS13ZGLnr+OOFbPDY5
 x1fAtdRmF8EuLtbs=
X-Received: by 2002:adf:f389:: with SMTP id m9mr4483919wro.195.1591712470765; 
 Tue, 09 Jun 2020 07:21:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVSbQF2Okg6IZQv8DAmCHaZ1KMAa/+F0HdbTOCecz1JLAkgSyXikD/mTwnw2Q5EztnLZDanQ==
X-Received: by 2002:adf:f389:: with SMTP id m9mr4483889wro.195.1591712470441; 
 Tue, 09 Jun 2020 07:21:10 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l1sm3989652wrb.31.2020.06.09.07.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 07:21:09 -0700 (PDT)
Subject: Re: [PATCH v5 06/11] riscv: Initial commit of OpenTitan machine
To: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
References: <cover.1590704015.git.alistair.francis@wdc.com>
 <0ab3cecbe801f9e14ad1a5447d02483b9008fdbb.1590704015.git.alistair.francis@wdc.com>
 <c3d7b26b-c55d-8ec5-3ee3-f197693b4378@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <7bb1bc10-e986-dcbc-630d-99660517c11b@redhat.com>
Date: Tue, 9 Jun 2020 16:21:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c3d7b26b-c55d-8ec5-3ee3-f197693b4378@greensocs.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jun 2020 14:21:18 -0000

On 6/9/20 3:48 PM, Damien Hedde wrote:
> 
> Hi Alistair,
> 
> On 5/29/20 12:14 AM, Alistair Francis wrote:
>> This adds a barebone OpenTitan machine to QEMU.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Bin Meng <bin.meng@windriver.com>
>> ---
> 
>> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
>> new file mode 100644
>> index 0000000000..a4b6499444
>> --- /dev/null
>> +++ b/include/hw/riscv/opentitan.h
>> @@ -0,0 +1,68 @@
> 
> [...]
> 
>> +
>> +static const struct MemmapEntry {
>> +    hwaddr base;
>> +    hwaddr size;
>> +} ibex_memmap[] = {
>> +    [IBEX_ROM] =            {  0x00008000,   0xc000 },
> 
> Shouldn't the ROM size be 0x4000 (which make the end of rom at 0xc000) ?
> 
> Not sure if that's exactly this platform you are modeling but the
> following doc says the ROM size is 16kB (0x4000):
> https://github.com/lowRISC/opentitan/blob/master/hw/top_earlgrey/doc/_index.md

Good catch. This is why I prefer the IEC notation:

    [IBEX_ROM] =            {  0x00008000,   16 * KiB },

You can then verify the mapping running 'info mtree' in the monitor.

> 
> --
> Damien
> 
> 



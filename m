Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo1KF-00050Q-6x
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 05:40:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo1KC-0004y4-Tt
 for qemu-riscv@nongnu.org; Fri, 19 Nov 2021 05:40:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo1K9-0003tH-R2
 for qemu-riscv@nongnu.org; Fri, 19 Nov 2021 05:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637318453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNW29QlzyrK/HRDX5UM1zsprjO9EIHL7sf8OT2fSyqY=;
 b=Qvqxo42UGp/s1jVcI1+TK7KysD7gNo90EPbaDErZzzjgAFRW7ImWJs8mNsx6bEd5xXdxT5
 QE+kNft+NRK3ePAJaTP2SnSw7W55wcgzMyDXw4o3vUw/R+in3IC8HIbHc3hqUnWwWKD+2e
 RVFBlx+uKegJPAzHFZAOmSzeEKbZ/KU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-309-B9zyCc5kOHKJblLOy_i7iQ-1; Fri, 19 Nov 2021 05:40:49 -0500
X-MC-Unique: B9zyCc5kOHKJblLOy_i7iQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso4521826wms.5
 for <qemu-riscv@nongnu.org>; Fri, 19 Nov 2021 02:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bNW29QlzyrK/HRDX5UM1zsprjO9EIHL7sf8OT2fSyqY=;
 b=TPYtG61KPpQa10CwVX1BrjP+Ptbdk/z/CNy75E273wRvMGOCsQvK3K7QOr5Kph5cFN
 o2MbuxyEVkUFIZthD+Jf0eWMgxwbs6I7uC2Zz2Gd8bJoRr51q5YK03GEZj6eC4oF/Hnh
 w4+olAg0lrRnE46uUV/DOqmAHDcD3DHoiQ16Rf6jeXo/4a2kaPkrEnUEp2ei8SZNfIo8
 3lvqYFhvEtoq8Kl48BmJoBNJha3XTHH1iw5SLLTFxhRxE0qN07SA/eVjPa9NbLtRlhJd
 TQjbfDx28tWY8whYnTxordr2WFmA+UdTaOqRzHhzjajIAkY7xz7rPL4N9xkkktqHNY8s
 cAFA==
X-Gm-Message-State: AOAM533eyJyqKPzJOzASHMX4D3fJi/CSinceNQg0OO6fx4SzeoTabC9H
 JAyqFgUjFuNM4GUf+fq+4gICEqEPigzoWQqgk7Fwsvu/Rw9jRumqdVp7HIjJ0VsOES6iCWj7/fd
 dMgYYUcVeoaCtcF4=
X-Received: by 2002:a5d:5186:: with SMTP id k6mr6158810wrv.146.1637318448390; 
 Fri, 19 Nov 2021 02:40:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhUQXOcGJVKBvKC6uBQ9fPTF4Eanll8zg+QnsEpZKoyivlL1AyJa2rxUFv6/jnHdDQZltDZw==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr6158766wrv.146.1637318448101; 
 Fri, 19 Nov 2021 02:40:48 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n1sm2975256wmq.6.2021.11.19.02.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 02:40:47 -0800 (PST)
Message-ID: <f2de8ec7-3157-0f87-cfc8-70633e0f8658@redhat.com>
Date: Fri, 19 Nov 2021 11:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2] hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP
 device instead of IF_NONE
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20211119102549.217755-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211119102549.217755-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 10:40:57 -0000

On 11/19/21 11:25, Thomas Huth wrote:
> Configuring a drive with "if=none" is meant for creation of a backend
> only, it should not get automatically assigned to a device frontend.
> Use "if=pflash" for the One-Time-Programmable device instead (like
> it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).
> 
> Since the old way of configuring the device has already been published
> with the previous QEMU versions, we cannot remove this immediately, but
> have to deprecate it and support it for at least two more releases.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 6 ++++++
>  hw/misc/sifive_u_otp.c    | 9 ++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)

> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> index 18aa0bd55d..cf6098ff2c 100644
> --- a/hw/misc/sifive_u_otp.c
> +++ b/hw/misc/sifive_u_otp.c
> @@ -209,7 +209,14 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
>                            TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>  
> -    dinfo = drive_get_next(IF_NONE);
> +    dinfo = drive_get_next(IF_PFLASH);
> +    if (!dinfo) {
> +        dinfo = drive_get_next(IF_NONE);

Isn't it a bug to call drive_get_next() from DeviceRealize()?

Shouldn't drive_get_next() be restricted to the MachineClass?



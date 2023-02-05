Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOnsp-0003gF-II
	for mharc-qemu-riscv@gnu.org; Sun, 05 Feb 2023 17:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOnsn-0003fY-PW; Sun, 05 Feb 2023 17:53:13 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOnsm-0001hi-1y; Sun, 05 Feb 2023 17:53:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZItfXwU+cMYtIJThc/oV8+j0gIqbXVTUwr8iMl1m73U=; b=wAxp1Vz0R2fCcH5bltixBZRDJ1
 prAyPTjOz6ZymSrTz9SjT6xftiTkzGOEX0bV6GmoDdbp0l2z39C3SIuC2GtPXJy58oGQpHV32SDWx
 8v2Mjh1DXSR/kRN/pXanpsQu3Q/F/6SHwzIBHRh+fJr2RSkNwsOBFeZB3cVZFv3qkS1jMhbwAd0PD
 W3LMTtBBXz7HReczRx0SCeYpAYhSREYWJSUnK5gVfEFQcIbgas0dSplLSMxQSISv3TEs38+1GGhdP
 3xP9dE5yxoHM0o0v6kQHrQxdJfkhYVM+3iDmPDMZmKAGuVEmLTmN7bQDxgTqD/aALxEwk+LHguKKK
 lwlzeNunEgva4CA7FxcKPoIah/fH/fuxuJQp3QMqipDGRsDhB4KcJs4WnBWzIIwfk5UdUzMGMc/V7
 ftm3+16Au7KM/F/fYfWSlxQrbbrpK8+sUFWnHjFZNXSleFrSgDknvgK0l4CqAQKNazMn4eA4FNJT8
 bgqYe8Q3L8UfYiJeNOy+KE8kAonNs7FhO6q4QBAYlrl6dsrgaDc+luk+1hnbm0S0O+5DPR15gGdSF
 IXILibFuEvBtMLxlqLtV6Ylo4M1wzaLdlZEsrWGv9xyfIAE12TGi/Lew8H2ZNY7QEB8+Uc5yfdiGI
 7JEI48uPehh1Tq1zVl2G8Sg0+cJ4HP3rlyJM7nnd4=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOnsB-0008AF-8h; Sun, 05 Feb 2023 22:52:39 +0000
Message-ID: <6a7298cd-9013-c3a8-ecf8-f8043448d207@ilande.co.uk>
Date: Sun, 5 Feb 2023 22:53:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230203180914.49112-1-philmd@linaro.org>
 <20230203180914.49112-3-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230203180914.49112-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 02/19] hw/qdev: Introduce qdev_prop_set_link()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
X-List-Received-Date: Sun, 05 Feb 2023 22:53:14 -0000

On 03/02/2023 18:08, Philippe Mathieu-Daudé wrote:

> Introduce qdev_prop_set_link(), equivalent of
> object_property_set_link() for QDev objects.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/qdev-properties.c    | 5 +++++
>   include/hw/qdev-properties.h | 1 +
>   2 files changed, 6 insertions(+)
> 
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 9789a2f5de..46236b1542 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -694,6 +694,11 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
>       }
>   }
>   
> +void qdev_prop_set_link(DeviceState *dev, const char *name, Object *value)
> +{
> +    object_property_set_link(OBJECT(dev), name, value, &error_abort);
> +}
> +
>   void qdev_prop_set_bit(DeviceState *dev, const char *name, bool value)
>   {
>       object_property_set_bool(OBJECT(dev), name, value, &error_abort);
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 21f399e9a3..c16dbefb2f 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -191,6 +191,7 @@ bool qdev_prop_set_drive_err(DeviceState *dev, const char *name,
>    * Set properties between creation and realization.
>    * @value must be valid.  Each property may be set at most once.
>    */
> +void qdev_prop_set_link(DeviceState *dev, const char *name, Object *value);
>   void qdev_prop_set_bit(DeviceState *dev, const char *name, bool value);
>   void qdev_prop_set_uint8(DeviceState *dev, const char *name, uint8_t value);
>   void qdev_prop_set_uint16(DeviceState *dev, const char *name, uint16_t value);

A general comment from me on this one: my feeling is that the main difference between 
QOM properties and qdev properties is that qdev properties are exposed to the user 
(for example they appear in the output of "-device foo,help") compared to QOM 
properties which tend to be used internally.

Following this thinking I'd always envisaged that an implementation of 
qdev_prop_set_link() would also be exposed to command line users so that you could 
set link properties from the command line similar to this:

   -device lance,id=lance0 -device ledma,dma=lance0

Of course this won't work in its current form (we don't have implicit ids for 
in-built devices as a starting point), but it does fit in with the recent discussions 
re: building machines completely from scratch. Certainly it feels to me as if this 
should be clarified before going ahead with a full-scale conversion for link 
properties as per this and your other related series.


ATB,

Mark.


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ly3qc-0006v2-2L
	for mharc-qemu-riscv@gnu.org; Mon, 28 Jun 2021 22:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ly3qb-0006up-12; Mon, 28 Jun 2021 22:51:37 -0400
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:49192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ly3qV-0008RW-R1; Mon, 28 Jun 2021 22:51:36 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07452463|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.0029479-0.000897628-0.996154;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KZYlZgT_1624935084; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KZYlZgT_1624935084)
 by smtp.aliyun-inc.com(10.147.43.95); Tue, 29 Jun 2021 10:51:24 +0800
Subject: Re: [RFC PATCH 03/11] hw/intc: Add CLIC device
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-4-zhiwei_liu@c-sky.com>
 <CANzO1D0Mxg6-AfPYb36=e4EebcSNF=u+yM5c=L+chLNq-n3xKw@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <9ff6e3f9-58ff-7a9b-2678-486d0f3b9cdf@c-sky.com>
Date: Tue, 29 Jun 2021 10:50:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANzO1D0Mxg6-AfPYb36=e4EebcSNF=u+yM5c=L+chLNq-n3xKw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------55895C893B79C53052CBD4CE"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.76; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-76.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 29 Jun 2021 02:51:37 -0000

This is a multi-part message in MIME format.
--------------55895C893B79C53052CBD4CE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/6/26 下午11:20, Frank Chang wrote:
> LIU Zhiwei <zhiwei_liu@c-sky.com <mailto:zhiwei_liu@c-sky.com>> 於 
> 2021年4月9日 週五 下午3:57寫道：
>
>
>     +
>     +/*
>     + * riscv_clic_create:
>     + *
>     + * @addr: base address of M-Mode CLIC memory-mapped registers
>     + * @prv_s: have smode region
>     + * @prv_u: have umode region
>     + * @num_harts: number of CPU harts
>     + * @num_sources: number of interrupts supporting by each aperture
>     + * @clicintctlbits: bits are actually implemented in the
>     clicintctl registers
>     + * @version: clic version, such as "v0.9"
>     + *
>     + * Returns: the device object
>     + */
>     +DeviceState *riscv_clic_create(hwaddr addr, bool prv_s, bool prv_u,
>     +                               uint32_t num_harts, uint32_t
>     num_sources,
>     +                               uint8_t clicintctlbits,
>     +                               const char *version)
>     +{
>     +    DeviceState *dev = qdev_new(TYPE_RISCV_CLIC);
>     +
>     +    assert(num_sources <= 4096);
>     +    assert(num_harts <= 1024);
>     +    assert(clicintctlbits <= 8);
>     +    assert(!strcmp(version, "v0.8") || !strcmp(version, "v0.9"));
>     +
>     +    qdev_prop_set_bit(dev, "prv-s", prv_s);
>     +    qdev_prop_set_bit(dev, "prv-u", prv_u);
>     +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
>     +    qdev_prop_set_uint32(dev, "num-sources", num_sources);
>     +    qdev_prop_set_uint32(dev, "clicintctlbits", clicintctlbits);
>     +    qdev_prop_set_uint64(dev, "mclicbase", addr);
>
>
> According to spec:
>   Since the CLIC memory map must be aligned at a 4KiB boundary,
>   the mclicbase CSR has its 12 least-significant bits hardwired to zero.
>   It is used to inform software about the location of CLIC memory 
> mappped registers.
>
> I think it's better to add another addr check to ensure it's 4KiB aligned.
>
Agree.

Thanks,
Zhiwei

> Thanks,
> Frank Chang
>
>     +    qdev_prop_set_string(dev, "version", version);
>     +
>     +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>     +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>     +    return dev;
>     +}
>     +
>

--------------55895C893B79C53052CBD4CE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/6/26 下午11:20, Frank Chang
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANzO1D0Mxg6-AfPYb36=e4EebcSNF=u+yM5c=L+chLNq-n3xKw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">LIU Zhiwei &lt;<a
            href="mailto:zhiwei_liu@c-sky.com" moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;
          於 2021年4月9日 週五 下午3:57寫道：<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            +<br>
            +/*<br>
            + * riscv_clic_create:<br>
            + *<br>
            + * @addr: base address of M-Mode CLIC memory-mapped
            registers<br>
            + * @prv_s: have smode region<br>
            + * @prv_u: have umode region<br>
            + * @num_harts: number of CPU harts<br>
            + * @num_sources: number of interrupts supporting by each
            aperture<br>
            + * @clicintctlbits: bits are actually implemented in the
            clicintctl registers<br>
            + * @version: clic version, such as "v0.9"<br>
            + *<br>
            + * Returns: the device object<br>
            + */<br>
            +DeviceState *riscv_clic_create(hwaddr addr, bool prv_s,
            bool prv_u,<br>
            +                               uint32_t num_harts, uint32_t
            num_sources,<br>
            +                               uint8_t clicintctlbits,<br>
            +                               const char *version)<br>
            +{<br>
            +    DeviceState *dev = qdev_new(TYPE_RISCV_CLIC);<br>
            +<br>
            +    assert(num_sources &lt;= 4096);<br>
            +    assert(num_harts &lt;= 1024);<br>
            +    assert(clicintctlbits &lt;= 8);<br>
            +    assert(!strcmp(version, "v0.8") || !strcmp(version,
            "v0.9"));<br>
            +<br>
            +    qdev_prop_set_bit(dev, "prv-s", prv_s);<br>
            +    qdev_prop_set_bit(dev, "prv-u", prv_u);<br>
            +    qdev_prop_set_uint32(dev, "num-harts", num_harts);<br>
            +    qdev_prop_set_uint32(dev, "num-sources", num_sources);<br>
            +    qdev_prop_set_uint32(dev, "clicintctlbits",
            clicintctlbits);<br>
            +    qdev_prop_set_uint64(dev, "mclicbase", addr);<br>
          </blockquote>
          <div><br>
          </div>
          <div>According to spec:</div>
          <div>  Since the CLIC memory map must be aligned at a 4KiB
            boundary,</div>
          <div>  the mclicbase CSR has its 12 least-significant bits
            hardwired to zero.</div>
          <div>  It is used to inform software about the location of
            CLIC memory mappped registers.<br>
          </div>
          <div><br>
          </div>
          <div>I think it's better to add another addr check to ensure
            it's 4KiB aligned.</div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Agree.</p>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite"
cite="mid:CANzO1D0Mxg6-AfPYb36=e4EebcSNF=u+yM5c=L+chLNq-n3xKw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>Thanks,<br>
          </div>
          <div>Frank Chang</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +    qdev_prop_set_string(dev, "version", version);<br>
            +<br>
            +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev),
            &amp;error_fatal);<br>
            +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);<br>
            +    return dev;<br>
            +}<br>
            +<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------55895C893B79C53052CBD4CE--

